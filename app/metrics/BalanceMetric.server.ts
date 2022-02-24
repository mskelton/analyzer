import { Deal } from "@prisma/client"
import { dateDiff, midnight } from "~/utils/date"
import { safeAdd } from "~/utils/math"
import { Metric } from "./Metric.server"

export class BalanceMetric extends Metric<number[]> {
  constructor(arn: string) {
    super(arn, "balance", [])
  }

  onSetup(deal: Deal) {
    const totalDays = dateDiff(Date.now(), deal.time) + 1

    this.value = new Array(totalDays).fill(0)
  }

  digest(deal: Deal) {
    super.digest(deal)

    const profit = this.getProfit(deal)
    const index = dateDiff(midnight(deal.time), midnight(this.start.time))

    this.value[index] += profit
  }

  async save() {
    console.log(this.value.reduce((a, b) => a + b, 0))

    await super.save()
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
