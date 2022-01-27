#property copyright "Mark Skelton"
#property link "https://github.com/mskelton/analyzer"
#property version "1.00"
#property description "Sends data to Analyzer"
#property strict

input int Interval = 5; // Interval (minutes)

int OnInit()
{
  EventSetTimer(Interval * 60);

  return INIT_SUCCEEDED;
}

void OnTimer()
{
  int total = HistoryDealsTotal();

  for (uint i = 0; i < total; i++)
  {
    uint ticket = HistoryDealGetTicket(i);
    uint type = HistoryDealGetInteger(ticket, DEAL_TYPE);

    Print("deal #", ticket, " of type ", type);
  }
}
