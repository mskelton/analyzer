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

  for (int i = 0; i < total; i++)
  {
    JsonBuilder json;
    ulong ticket = HistoryDealGetTicket(i);

    json.str("comment", HistoryDealGetString(ticket, DEAL_COMMENT));
    json.num("commission", HistoryDealGetDouble(ticket, DEAL_COMMISSION));
    json.str("entry", EnumToString(ENUM_DEAL_ENTRY(HistoryDealGetInteger(ticket, DEAL_ENTRY))));
    json.num("fee", HistoryDealGetDouble(ticket, DEAL_FEE));
    json.num("magic", HistoryDealGetInteger(ticket, DEAL_MAGIC));
    json.num("order", HistoryDealGetInteger(ticket, DEAL_ORDER));
    json.num("price", HistoryDealGetDouble(ticket, DEAL_PRICE));
    json.num("profit", HistoryDealGetDouble(ticket, DEAL_PROFIT));
    json.str("reason", EnumToString(ENUM_DEAL_REASON(HistoryDealGetInteger(ticket, DEAL_REASON))));
    json.num("sl", HistoryDealGetDouble(ticket, DEAL_SL));
    json.num("swap", HistoryDealGetDouble(ticket, DEAL_SWAP));
    json.str("symbol", HistoryDealGetString(ticket, DEAL_SYMBOL));
    json.num("ticket", ticket);
    json.num("time", HistoryDealGetInteger(ticket, DEAL_TIME_MSC));
    json.num("tp", HistoryDealGetDouble(ticket, DEAL_TP));
    json.str("type", EnumToString(ENUM_DEAL_TYPE(HistoryDealGetInteger(ticket, DEAL_TYPE))));
    json.num("volume", HistoryDealGetDouble(ticket, DEAL_VOLUME));

    Print("deal #", ticket, json.toString());
  }
}

datetime getLastUpdateTime()
{
  //   string headers;
  //   char data[], result[];

  //   ResetLastError();
  //   int res = WebRequest("GET", BASE_URL, NULL, NULL, 500, data, 0, result, headers);

  //   if (res == 200)
  //   {
  //     //--- Successful download
  //     // PrintFormat("The file has been successfully downloaded, File size %d byte.", ArraySize(result));
  //     PrintFormat("Server headers: %s", headers);
  //   }
  //   else if (res == -1)
  //   {
  //     Print("Error in WebRequest. Error code=", GetLastError());
  //     // MessageBox("Add the URL '" + url + "' to the list of allowed URLs on tab 'Expert Advisors'", "Error", MB_ICONINFORMATION);
  //   }
  //   else
  //   {
  //     PrintFormat("Downloading '%s' failed, error code %d", BASE_URL, res);
  //   }

  return 0;
}

class JsonBuilder
{
  string json;

  template <typename T>
  void set(string key, T value)
  {
    json += (StringLen(json) > 0 ? "," : "") + "\"" + key + "\":" + value;
  }

public:
  void str(string key, string value)
  {
    GetPointer(this).set(key, "\"" + value + "\"");
  }

  void num(string key, double value)
  {
    GetPointer(this).set(key, string(value));
  }

  string toString() { return "{" + json + "}"; }
};
