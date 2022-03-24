import { Deal } from "@prisma/client"
import { dateDiff, midnight } from "~/utils/date"
import { Metric } from "./Metric.server"

export abstract class DailyMetric extends Metric<number[]> {
  constructor() {
    super([])
  }

  setup(deal: Deal) {
    const days = dateDiff(Date.now(), deal.time) + 1

    // Initialize the array with zeroes for each day between the first deal and
    // today. This allows `digest` to easily add to any position in the array.
    this.value = new Array(days).fill(0)
  }

  getDayIndex(deal: Deal) {
    return dateDiff(midnight(deal.time), midnight(this.start.time))
  }
}
