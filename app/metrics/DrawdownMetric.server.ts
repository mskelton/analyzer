import { Account } from "@prisma/client"
import { dateDiff, midnight } from "~/utils/date"

export class DrawdownMetric {
  private current = 0
  private value: number[]

  constructor(private account: Account) {
    this.value = account.metrics?.drawdown?.value ?? []
  }

  update(drawdown: number) {
    const updatedAt = this.account.metrics?.drawdown?.updatedAt

    // If the drawdown metric already exists, we need to find the last time it
    // was updated and fill any missing days with 0% drawdown (unknown).
    if (this.value.length && updatedAt) {
      const days = dateDiff(midnight(updatedAt), midnight(Date.now()))
      this.value.push(...Array(days).fill(0))
    } else {
      this.value.push(0)
    }

    // Set the current drawdown as whatever it currently is, but set the daily
    // drawdown to the max drawdown.
    this.current = drawdown
    this.value[this.value.length - 1] = Math.max(
      this.value.at(-1)!,
      this.current
    )

    return this
  }

  toJSON() {
    return {
      current: this.current,
      updatedAt: new Date(),
      value: this.value,
    }
  }
}
