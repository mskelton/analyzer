import type { Deal, MetricType } from "@prisma/client"

export abstract class Metric<T> {
  protected start: Deal = null!

  constructor(protected key: MetricType, protected value: T) {}

  abstract setup(deal: Deal): void

  digest(deal: Deal) {
    if (!this.start) {
      this.start = deal
      this.setup(deal)
    }
  }

  toJSON() {
    return {
      key: this.key,
      updatedAt: new Date(),
      value: this.value,
    }
  }
}
