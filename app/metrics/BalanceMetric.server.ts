import { Deal } from "@prisma/client"
import { dateDiff, midnight } from "~/utils/date"
import { round, safeAdd } from "~/utils/math"
import { Metric } from "./Metric.server"

export class BalanceMetric extends Metric<number[]> {
  constructor() {
    super("BALANCE", [])
  }

  setup(deal: Deal) {
    this.value = new Array(dateDiff(Date.now(), deal.time) + 1).fill(0)
  }

  digest(deal: Deal) {
    super.digest(deal)

    const profit = this.getProfit(deal)
    const index = dateDiff(midnight(deal.time), midnight(this.start.time))

    this.value[index] += profit
  }

  toJSON() {
    // After calculating the balance change for each day, we can increase each
    // days balance by the previous day's balance. This produces a result where
    // each data point represents the current balance as of that day.
    for (let i = 0; i < this.value.length; i++) {
      this.value[i] += round(this.value[i - 1] ?? 0)
    }

    return super.toJSON()
  }

  private getProfit(deal: Deal) {
    switch (true) {
      case deal.entry === "DEAL_ENTRY_IN" && deal.type === "DEAL_TYPE_BALANCE":
        return deal.profit!

      case deal.entry === "DEAL_ENTRY_OUT":
        return safeAdd(deal.profit, deal.swap)

      case deal.entry === "DEAL_ENTRY_IN":
        return safeAdd(deal.fee, deal.commission)

      default:
        console.log(deal)
        throw new Error("Unhandled deal")
    }
  }
}
