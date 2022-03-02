#property copyright "Mark Skelton"
#property link "https://github.com/mskelton/analyzer"
#property version "1.00"
#property description "Sends data to Analyzer for processing. For this EA to work properly, you must first allow it to access the Analyzer server. Go to Main Menu->Tools->Options and select the Expert Advisors tab. Then, check \"Allow WebRequest for listed URL\" and enter \"https://analyzer.mskelton.dev\" to allow publishing trades to Analyzer."
#property strict

#include "DataBuilder.mqh"
#include "JsonBuilder.mqh"

input int INTERVAL = 5;  // Interval (minutes)
input string TOKEN;      // Account token

// When defined, allow changing the base URL to a local server.
// #define LOCAL

#ifdef LOCAL
input string BASE_URL = "";  // Analyzer URL
#else
const string BASE_URL = "https://analyzer.mskelton.dev";  // Analyzer URL
#endif

int OnInit() {
#ifndef LOCAL
  // Users can increase the interval to update less frequently, but to prevent
  // overloading Analyzer, set the minimum interval to 5 minutes.
  if (INTERVAL < 5) {
    MessageBox("Interval must be at least 5 minutes.", "Error", MB_ICONERROR);
    return INIT_PARAMETERS_INCORRECT;
  }
#endif

  // Setup a timer to send data to Analyzer and manually trigger the timer
  // once to send the initial data.
  EventSetTimer(INTERVAL * 60);
  OnTimer();

  return INIT_SUCCEEDED;
}

void OnTimer() {
  Print("Searching for new trades to ingest...");

  HistorySelect(getLastUpdateTime(), TimeCurrent());
  int total = HistoryDealsTotal();

  // If there aren't any trades, we can return early.
  if (!total) {
    Print("No new trades found");
    return;
  }

  DataBuilder data;
  int batch = 1;

  for (int i = 0; i < total; i++) {
    JsonBuilder deal;
    ulong ticket = HistoryDealGetTicket(i);

    deal.setString("comment", HistoryDealGetString(ticket, DEAL_COMMENT));
    deal.setDouble("commission", HistoryDealGetDouble(ticket, DEAL_COMMISSION));
    deal.setString("entry", EnumToString(ENUM_DEAL_ENTRY(HistoryDealGetInteger(ticket, DEAL_ENTRY))));
    deal.setDouble("fee", HistoryDealGetDouble(ticket, DEAL_FEE));
    deal.setInt("magic", HistoryDealGetInteger(ticket, DEAL_MAGIC));
    deal.setDouble("price", HistoryDealGetDouble(ticket, DEAL_PRICE));
    deal.setDouble("profit", HistoryDealGetDouble(ticket, DEAL_PROFIT));
    deal.setString("reason", EnumToString(ENUM_DEAL_REASON(HistoryDealGetInteger(ticket, DEAL_REASON))));
    deal.setDouble("sl", HistoryDealGetDouble(ticket, DEAL_SL));
    deal.setDouble("swap", HistoryDealGetDouble(ticket, DEAL_SWAP));
    deal.setString("symbol", HistoryDealGetString(ticket, DEAL_SYMBOL));
    deal.setInt("ticket", ticket);
    deal.setInt("time", HistoryDealGetInteger(ticket, DEAL_TIME_MSC));
    deal.setDouble("tp", HistoryDealGetDouble(ticket, DEAL_TP));
    deal.setString("type", EnumToString(ENUM_DEAL_TYPE(HistoryDealGetInteger(ticket, DEAL_TYPE))));
    deal.setDouble("volume", HistoryDealGetDouble(ticket, DEAL_VOLUME));

    // Stringify the object and add it to the data builder
    data.append(deal.toObject());

    // Send in batches of 100, resetting the JSON builder after each batch.
    if (i % 100 == 0) {
      Print("Sending batch ", batch++, " to Analyzer...");
      if (!ingestDeals(data.toString())) return;
      data.clear();
    }
  }

  // Send any remaining data that didn't fill a batch
  if (!data.empty()) {
    Print("Sending final batch of data to Analyzer...");
    if (!ingestDeals(data.toString())) return;
  }

  // After ingesting all the deals, update the metrics for the account
  Print("Updating metrics...");
  if (!updateMetrics()) return;

  Print("Successfully processed ", total, " deals");
}

/**
 * Gets the last updated time from Analyzer so we only have to select
 * unprocessed trades from history.
 */
long getLastUpdateTime() {
  char data[];
  request_result res = request("GET", BASE_URL + "/api/deals/last-updated", NULL, data);

  if (res.ok) {
    // The last updated time is the time of the last deal uploaded to Analyzer.
    // As such, we have to add one second to the time to get the next set of
    // deals without including any of the deals that were already uploaded.
    return StringToInteger(res.data) + 1;
  }

  PrintFormat("Failed to get last updated time with status code %d", res.status);

  // If we can't get the last updated time, we'll just return the current time.
  // This will result in no data being sent to Analyzer, which is marginally
  // better, than always sending the full history.
  return TimeCurrent();
}

/**
 * Sends a batch of deals to Analyzer for ingestion.
 */
bool ingestDeals(string stringData) {
  // Convert the data string to the appropriate format
  uchar jsonData[];
  StringToCharArray(stringData, jsonData, 0, StringLen(stringData));

  request_result res = request("POST", BASE_URL + "/api/deals", "Content-Type:application/json", jsonData);

  if (!res.ok) {
    PrintFormat("Failed to ingest deals with status code %d", res.status);
  }

  return res.ok;
}

/**
 * Sends a request to Analyzer to update metrics for a given account. This is
 * called once after ingesting any new deals.
 */
bool updateMetrics() {
  char data[];
  request_result res = request("POST", BASE_URL + "/api/metrics", NULL, data);

  if (!res.ok) {
    PrintFormat("Failed to updated metrics with status code %d", res.status);
  }

  return res.ok;
}

struct request_result {
  bool ok;
  int status;
  string data;
};

/**
 * Simple wrapper around `WebRequest` to make it easier to use.
 */
request_result request(const string method, const string url, const string headers, char &data[]) {
  ResetLastError();

  char serverResult[];
  string serverHeaders;
  string tokenHeader = "Authorization: Bearer " + TOKEN + "\r\n";

  int status = WebRequest(method, url, tokenHeader + headers, 500, data, serverResult, serverHeaders);
  bool ok = status >= 200 && status < 300;

  // A status code of -1 generally means that the user forgot to add the URL to
  // the list of allowed WebRequest URLs.
  if (status == -1) {
    MessageBox(
        "Add the URL '" + BASE_URL + "' to the list of allowed URLs on tab 'Expert Advisors'",
        "Error",
        MB_ICONINFORMATION);
  }

  request_result res = {ok, status, CharArrayToString(serverResult)};
  return res;
}
