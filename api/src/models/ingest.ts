export interface Position {
  comment?: string
  price?: number
  sl?: number
  symbol: string
  ticket: string
  tp?: number
  type: "POSITION_TYPE_BUY" | "POSITION_TYPE_SELL"
  volume: number
}
