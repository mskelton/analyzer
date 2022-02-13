import { Deal } from "api"
import { randomTicket } from "./random"

export function createDeal(partialDeal: Partial<Deal> = {}): Deal {
  return {
    comment: "Integ testing",
    commission: 0,
    entry: "DEAL_ENTRY_IN",
    fee: 0,
    magic: 123,
    order: 0,
    price: 1,
    profit: 0,
    reason: "DEAL_REASON_EXPERT",
    swap: 0,
    symbol: "USDCAD",
    ticket: randomTicket(),
    time: 1642771512,
    type: "DEAL_TYPE_BUY",
    volume: 0.1,
    ...partialDeal,
  }
}
