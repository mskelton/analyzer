import type { Deal, MetricType } from "@prisma/client"

export abstract class Metric<T> {
  protected updatedAt = 0
  protected start: Deal = null!

  constructor(protected key: MetricType, protected value: T) {}

  abstract setup(deal: Deal): void

  digest(deal: Deal) {
    this.updatedAt = Math.max(this.updatedAt, deal.time)

    if (!this.start) {
      this.start = deal
      this.setup(deal)
    }
  }

  toJSON() {
    return {
      key: this.key,
      updatedAt: new Date(this.updatedAt),
      value: this.value,
    }
  }
}
