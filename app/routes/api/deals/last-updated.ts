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

  return new Response((deal?.time ?? 0).toString(), {
    status: 200,
  })
}
