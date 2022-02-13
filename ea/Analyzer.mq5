#property copyright "Mark Skelton"
#property link "https://github.com/mskelton/analyzer"
#property version "1.00"
#property description "Sends data to Analyzer for processing. For this EA to work properly, you must first allow it to access the Analyzer server. Go to Main Menu->Tools->Options and select the Expert Advisors tab. Then, check \"Allow WebRequest for listed URL\" and enter \"https://mskelton.dev\" to allow publishing trades to Analyzer."
#property strict

input int INTERVAL = 5;                                      // Interval (minutes)
input string BASE_URL = "https://mskelton.dev/analyzer/api"; // Analyzer service URL

int OnInit()
{
  // Setup a timer to send data to Analyzer and manually trigger the timer
  // once to send the initial data.
  EventSetTimer(INTERVAL * 60);
  OnTimer();

  return INIT_SUCCEEDED;
}

void OnTimer()
{
  Print("Searching for new trades to ingest...");

  HistorySelect(getLastUpdateTime(), TimeCurrent());
  int total = HistoryDealsTotal();
  JsonBuilder json;

  for (int i = 0; i < total; i++)
  {
    JsonBuilder deal;
    ulong ticket = HistoryDealGetTicket(i);

    deal.setString("comment", HistoryDealGetString(ticket, DEAL_COMMENT));
    deal.setDouble("commission", HistoryDealGetDouble(ticket, DEAL_COMMISSION));
    deal.setString("entry", EnumToString(ENUM_DEAL_ENTRY(HistoryDealGetInteger(ticket, DEAL_ENTRY))));
    deal.setDouble("fee", HistoryDealGetDouble(ticket, DEAL_FEE));
    deal.setInt("magic", HistoryDealGetInteger(ticket, DEAL_MAGIC));
    deal.setInt("order", HistoryDealGetInteger(ticket, DEAL_ORDER));
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

    json.append(deal.toObject());
  }

  if (total)
  {
    Print("Sending data to Analyzer...");
    sendData("{\"deals\": " + json.toArray() + "}");
  }
}

long getLastUpdateTime()
{
  char data[];
  request_result res = request("GET", BASE_URL + "/deals/last-updated", NULL, data);

  if (res.ok)
  {
    return StringToInteger(res.data);
  }

  PrintFormat("Failed to get last updated time with status code %d", res.status);
  return TimeCurrent();
}

void sendData(string stringData)
{
  // Convert the data string to the appropriate format
  uchar jsonData[];
  StringToCharArray(stringData, jsonData, 0, StringLen(stringData));

  request_result res = request("POST", BASE_URL + "/deals", "Content-Type:application/json", jsonData);

  if (res.ok)
  {
    Print("Successfully sent data to Analyzer.");
  }
  else
  {
    PrintFormat("Failed to send data to Analyzer with status code %d", res.status);
  }
}

struct request_result
{
  bool ok;
  int status;
  string data;
};

request_result request(const string method, const string url, const string headers, char &data[])
{
  ResetLastError();

  char serverResult[];
  string serverHeaders;

  int status = WebRequest(method, url, headers, 500, data, serverResult, serverHeaders);
  bool ok = status >= 200 && status < 300;

  if (status == -1)
  {
    MessageBox("Add the URL '" + BASE_URL + "' to the list of allowed URLs on tab 'Expert Advisors'", "Error", MB_ICONINFORMATION);
  }

  request_result res = {ok, status, CharArrayToString(serverResult)};
  return res;
}

class JsonBuilder
{
  string json;

  template <typename T>
  void set(string key, T value)
  {
    GetPointer(this).append("\"" + key + "\":" + value);
  }

public:
  void append(string value)
  {
    json += (StringLen(json) ? "," : "") + value;
  }

  void setString(string key, string value)
  {
    if (StringLen(value))
      GetPointer(this).set(key, "\"" + value + "\"");
  }

  void setInt(string key, ulong value)
  {
    if (!value)
      GetPointer(this).set(key, string(value));
  }

  void setDouble(string key, double value)
  {
    if (!value)
      GetPointer(this).set(key, string(value));
  }

  string toArray() { return "[" + json + "]"; }

  string toObject() { return "{" + json + "}"; }
};
