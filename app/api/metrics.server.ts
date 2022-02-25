import { db, streamFromDB } from "~/db.server"
import { BalanceMetric } from "~/metrics/BalanceMetric.server"
import { getAccountFromToken } from "./accounts.server"

export async function updateMetrics(request: Request) {
  const metrics = [new BalanceMetric()]

  const account = await getAccountFromToken(request)
  const deals = streamFromDB((cursor) => {
    return db.deal.findMany({
      cursor,
      orderBy: { time: "asc" },
      skip: cursor ? 1 : 0,
      take: 50,
      where: { accountArn: account.arn },
    })
  })

  // Iterate through all the deals, digesting each deal into each metric
  for await (const deal of deals) {
    metrics.forEach((metric) => metric.digest(deal))
  }

  // Once all the deals have been digested, save the updated metrics to the
  // account. Since we replace the entire metrics array, we don't need to main
  // array order or update the existing objects.
  await db.account.update({
    data: {
      metrics: metrics.map((metric) => metric.toJSON()),
    },
    where: { id: account.id },
  })
}
