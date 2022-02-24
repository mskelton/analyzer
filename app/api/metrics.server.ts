import { db } from "~/db.server"
import { BalanceMetric } from "~/metrics/BalanceMetric.server"
import { getAccountFromToken } from "./accounts.server"

async function* getDeals(accountArn: string) {
  let cursor: string | undefined

  while (true) {
    const deals = await db.deal.findMany({
      cursor: cursor ? { id: cursor } : undefined,
      orderBy: { time: "asc" },
      skip: cursor ? 1 : 0,
      take: 50,
      where: { accountArn },
    })

    // Once no more deals are returned, we're done
    if (!deals.length) return

    // Yield each deal to the metrics for consumption
    for (const deal of deals) {
      yield deal
    }

    // Update the cursor position
    cursor = deals[deals.length - 1]?.id
  }
}

export async function updateMetrics(request: Request) {
  const account = await getAccountFromToken(request)
  const metrics = [new BalanceMetric(account.arn)]

  for await (const deal of getDeals(account.arn)) {
    metrics.forEach((metric) => metric.digest(deal))
  }

  await Promise.all(metrics.map((metric) => metric.save()))
}
