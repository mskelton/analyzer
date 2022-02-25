import { Deal } from "@prisma/client"
import { ActionFunction } from "remix"
import { getAccountFromToken } from "~/api/accounts.server"
import { db } from "~/db.server"
import { createArn, parseArn } from "~/utils/arn"
import { generateId } from "~/utils/id.server"

type NewDeal = Omit<Deal, "id" | "arn" | "accountArn">

export const action: ActionFunction = async ({ request }) => {
  const body = (await request.json()) as { deals: NewDeal[] }
  const account = await getAccountFromToken(request)
  const { userId } = parseArn(account.arn)

  // Add the account ARN and generate a deal ARN
  const deals = body.deals.map(async (deal) => ({
    ...deal,
    accountArn: account.arn,
    arn: createArn("deal", userId, await generateId()),
  }))

  await db.deal.createMany({
    data: await Promise.all(deals),
  })

  return new Response(null, { status: 201 })
}
