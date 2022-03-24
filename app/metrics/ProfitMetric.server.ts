import { Deal } from "@prisma/client"
import { safeAdd } from "~/utils/math"
import { DailyMetric } from "./DailyMetric.server"

export class ProfitMetric extends DailyMetric {
  private deposits = 0

  digest(deal: Deal) {
    super.digest(deal)
    this.value[this.getDayIndex(deal)] += this.getProfit(deal)
  }

  private getProfit(deal: Deal) {
    switch (true) {
      // When a deposit is made, we update the total deposits amount as that
      // affects how we calculate profit.
      case deal.entry === "DEAL_ENTRY_IN" && deal.type === "DEAL_TYPE_BALANCE":
        this.deposits += deal.profit!
        return 0

      case deal.entry === "DEAL_ENTRY_IN":
      case deal.entry === "DEAL_ENTRY_OUT": {
        // To calculate profit, we first calculate change in balance. This works
        // both for opening and closing deals as missing data will default to 0.
        const change = safeAdd(
          deal.profit,
          deal.swap,
          deal.fee,
          deal.commission
        )

        // Then, we can divide the change by the total deposits to get a
        // percentage which we multiple by 100 to convert to beinteger based
        return (change / this.deposits) * 100
      }

      default:
        console.log(deal)
        throw new Error("Unhandled deal")
    }
  }
}
