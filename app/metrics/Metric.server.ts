import type { Deal } from "@prisma/client"

export abstract class Metric<T> {
  protected start: Deal = null!

  constructor(protected value: T) {}

  abstract setup(deal: Deal): void

  digest(deal: Deal) {
    if (!this.start) {
      this.start = deal
      this.setup(deal)
    }
  }

  toJSON() {
    return {
      updatedAt: new Date(),
      value: this.value,
    }
  }
}
