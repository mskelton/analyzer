export interface Deal {
  comment?: string
  commission?: number
  entry:
    | "DEAL_ENTRY_IN"
    | "DEAL_ENTRY_OUT"
    | "DEAL_ENTRY_INOUT"
    | "DEAL_ENTRY_OUT_BY"
  fee?: number
  magic?: number
  order?: number
  price?: number
  profit?: number
  reason:
    | "DEAL_REASON_CLIENT"
    | "DEAL_REASON_MOBILE"
    | "DEAL_REASON_WEB"
    | "DEAL_REASON_EXPERT"
    | "DEAL_REASON_SL"
    | "DEAL_REASON_TP"
    | "DEAL_REASON_SO"
    | "DEAL_REASON_ROLLOVER"
    | "DEAL_REASON_VMARGIN"
    | "DEAL_REASON_SPLIT"
  sl?: number
  swap?: number
  symbol?: string
  ticket: number
  time: number
  tp?: number
  type:
    | "DEAL_TYPE_BUY"
    | "DEAL_TYPE_SELL"
    | "DEAL_TYPE_BALANCE"
    | "DEAL_TYPE_CREDIT"
    | "DEAL_TYPE_CHARGE"
    | "DEAL_TYPE_CORRECTION"
    | "DEAL_TYPE_BONUS"
    | "DEAL_TYPE_COMMISSION"
    | "DEAL_TYPE_COMMISSION_DAILY"
    | "DEAL_TYPE_COMMISSION_MONTHLY"
    | "DEAL_TYPE_COMMISSION_AGENT_DAILY"
    | "DEAL_TYPE_COMMISSION_AGENT_MONTHLY"
    | "DEAL_TYPE_INTEREST"
    | "DEAL_TYPE_BUY_CANCELED"
    | "DEAL_TYPE_SELL_CANCELED"
    | "DEAL_DIVIDEND"
    | "DEAL_DIVIDEND_FRANKED"
    | "DEAL_TAX"
  volume?: number
}
