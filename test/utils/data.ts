import { Deal } from "@prisma/client"
import { randomTicket } from "./random"

export function buildDeal(data: Partial<Deal> = {}) {
  return {
    accountArn: "arn:aws:iam::123456789012:user/test",
    entry: "DEAL_ENTRY_IN",
    price: 1,
    profit: 0,
    reason: "DEAL_REASON_EXPERT",
    symbol: "USDCAD",
    ticket: randomTicket(),
    time: 1642771512,
    type: "DEAL_TYPE_BUY",
    volume: 0.1,
    ...data,
  } as Deal
}
