export interface OrderTiming {
  done?: number
  expiration?: number
  setup: number
}

export interface OrderPricing {
  current?: number
  open: number
  stopLimit?: number
}

export interface Order {
  comment?: string
  magic?: number
  pricing: OrderPricing
  reason:
    | "ORDER_REASON_CLIENT"
    | "ORDER_REASON_MOBILE"
    | "ORDER_REASON_WEB"
    | "ORDER_REASON_EXPERT"
    | "ORDER_REASON_SL"
    | "ORDER_REASON_TP"
    | "ORDER_REASON_SO"
  sl?: number
  symbol: string
  ticket: number
  timing: OrderTiming
  tp?: number
  type:
    | "ORDER_TYPE_BUY"
    | "ORDER_TYPE_SELL"
    | "ORDER_TYPE_BUY_LIMIT"
    | "ORDER_TYPE_SELL_LIMIT"
    | "ORDER_TYPE_BUY_STOP"
    | "ORDER_TYPE_SELL_STOP"
    | "ORDER_TYPE_BUY_STOP_LIMIT"
    | "ORDER_TYPE_SELL_STOP_LIMIT"
    | "ORDER_TYPE_CLOSE_BY"
  volume: number // ORDER_VOLUME_CURRENT
}
