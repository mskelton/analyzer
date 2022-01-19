export interface Trade {
  action:
    | "TRADE_ACTION_DEAL"
    | "TRADE_ACTION_PENDING"
    | "TRADE_ACTION_SLTP"
    | "TRADE_ACTION_MODIFY"
    | "TRADE_ACTION_REMOVE"
    | "TRADE_ACTION_CLOSE_BY"
  comment?: string
  order: string
  orderType:
    | "ORDER_TYPE_BUY"
    | "ORDER_TYPE_SELL"
    | "ORDER_TYPE_BUY_LIMIT"
    | "ORDER_TYPE_SELL_LIMIT"
    | "ORDER_TYPE_BUY_STOP"
    | "ORDER_TYPE_SELL_STOP"
    | "ORDER_TYPE_BUY_STOP_LIMIT"
    | "ORDER_TYPE_SELL_STOP_LIMIT"
    | "ORDER_TYPE_CLOSE_BY"
  price?: number
  sl?: number
  stoplimit?: number
  symbol: string
  tp?: number
  volume: number
}
