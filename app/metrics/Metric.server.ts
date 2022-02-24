import { Deal } from "@prisma/client"
import { db } from "~/db.server"

export abstract class Metric<T> {
  protected lastUpdated = 0
  protected start: Deal = null!

  constructor(private arn: string, protected key: string, protected value: T) {}

  abstract onSetup(deal: Deal): void

  digest(deal: Deal) {
    this.lastUpdated = Math.max(this.lastUpdated, deal.time)

    if (!this.start) {
      this.start = deal
      this.onSetup(deal)
    }
  }

  async save() {
    // const data = { key: this.key, value: this.data }
    // await db.metric.upsert({
    //   create: {
    //     ...data,
    //     arn: this.arn,
    //   },
    //   update: data,
    //   where: { arn: this.arn },
    // })
  }
}
