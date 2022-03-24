import { db, streamFromDB } from "~/db.server"
import { BalanceMetric } from "~/metrics/BalanceMetric.server"
import { ProfitMetric } from "~/metrics/ProfitMetric.server"
import { getAccountFromToken } from "./accounts.server"

export async function updateMetrics(request: Request) {
  const account = await getAccountFromToken(request)
  const metrics = [new BalanceMetric(), new ProfitMetric()]

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

  // Prepare the metrics to save to the DB
  const [balance, profit] = metrics.map((metric) => metric.toJSON())

  // Once all the deals have been digested, save the updated metrics to the
  // account. Since we replace the entire metrics array, we don't need to main
  // array order or update the existing objects.
  await db.account.update({
    data: {
      metrics: {
        upsert: {
          set: { balance, profit },
          update: { balance, profit },
        },
      },
    },
    where: { id: account.id },
  })
}
