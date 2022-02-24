import { Deal } from "@prisma/client"
import { Metric } from "./Metric.server"

export class BalanceMetric extends Metric<number[]> {
  constructor(arn: string) {
    super(arn, "balance", [])
  }

  onSetup(deal: Deal) {
    const totalDays = this.daysBetween(Date.now(), deal.time) + 1

    this.value = new Array(totalDays).fill(0)
  }

  digest(deal: Deal) {
    super.digest(deal)

    const index = this.getDayIndex(deal)
    const profit = this.getProfit(deal)

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
        return this.add(deal.profit, deal.swap)

      case deal.entry === "DEAL_ENTRY_IN":
        return this.add(deal.fee, deal.commission)

      default:
        console.log(deal)
        throw new Error("Unhandled deal")
    }
  }

  private add(a: number | null, b: number | null) {
    return (a ?? 0) + (b ?? 0)
  }

  private getDayIndex(deal: Deal) {
    return this.daysBetween(this.sod(deal.time), this.sod(this.start.time))
  }

  private sod(time: number) {
    const date = new Date(time)
    date.setUTCHours(0, 0, 0, 0)

    return date
  }

  private daysBetween(a: Date | number, b: Date | number) {
    const diff = new Date(a).getTime() - new Date(b).getTime()
    return Math.ceil(Math.abs(diff / 864e5))
  }
}
