import { LoaderFunction } from "remix"
import { getAccountFromToken } from "~/api/accounts.server"
import { db } from "~/db.server"

export const loader: LoaderFunction = async ({ request }) => {
  const account = await getAccountFromToken(request)
  const deal = await db.deal.findFirst({
    orderBy: { time: "desc" },
    select: { time: true },
    where: { accountArn: account.arn },
  })

  // Convert the time to seconds which is what the EA expects
  const time = (deal?.time ?? 0) / 1000

  return new Response(time.toString(), {
    status: 200,
  })
}
