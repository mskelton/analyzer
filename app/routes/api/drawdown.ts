import { ActionFunction } from "remix"
import { getAccountFromToken } from "~/api/accounts.server"
import { db } from "~/db.server"
import { DrawdownMetric } from "~/metrics/DrawdownMetric.server"

export const action: ActionFunction = async ({ request }) => {
  const body = (await request.json()) as { drawdown: number }
  const account = await getAccountFromToken(request)

  // Recalculate the drawdown metric
  const drawdown = new DrawdownMetric(account).update(body.drawdown).toJSON()

  // Update the drawdown metric in the DB
  await db.account.update({
    data: {
      metrics: {
        upsert: {
          set: { drawdown },
          update: { drawdown },
        },
      },
    },
    where: { id: account.id },
  })

  return new Response(null, { status: 201 })
}
