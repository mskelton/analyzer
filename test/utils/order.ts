import { Order } from "api"
import { randomTicket } from "./random"

export function createOrder(partialOrder: Partial<Order> = {}): Order {
  return {
    comment: "Integ testing",
    magic: 123,
    pricing: {
      open: 0.9,
    },
    reason: "ORDER_REASON_EXPERT",
    symbol: "USDCAD",
    ticket: randomTicket(),
    timing: {
      setup: 1642771512,
    },
    type: "ORDER_TYPE_BUY",
    volume: 0.1,
    ...partialOrder,
  }
}
