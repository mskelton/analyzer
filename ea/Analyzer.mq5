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
    ulong ticket = HistoryDealGetTicket(i);
    string type = EnumToString(ENUM_DEAL_TYPE(HistoryDealGetInteger(ticket, DEAL_TYPE)));

    Print("deal #", ticket, " of type ", type);
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
