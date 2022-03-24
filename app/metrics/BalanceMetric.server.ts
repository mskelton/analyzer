import { Deal } from "@prisma/client"
import { safeAdd } from "~/utils/math"
import { DailyMetric } from "./DailyMetric.server"

export class BalanceMetric extends DailyMetric {
  digest(deal: Deal) {
    super.digest(deal)
    this.value[this.getDayIndex(deal)] += this.getProfit(deal)
  }

  private getProfit(deal: Deal) {
    switch (true) {
      case deal.entry === "DEAL_ENTRY_IN" && deal.type === "DEAL_TYPE_BALANCE":
        return deal.profit!

      case deal.entry === "DEAL_ENTRY_IN":
      case deal.entry === "DEAL_ENTRY_OUT":
        return safeAdd(deal.profit, deal.swap, deal.fee, deal.commission)

      default:
        console.log(deal)
        throw new Error("Unhandled deal")
    }
  }
}
