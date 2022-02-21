import { Deal } from "@prisma/client"
import { ActionFunction } from "remix"
import { db } from "~/db/db.server"
import { createArn } from "~/utils/arn"
import { generateId } from "~/utils/id.server"

type NewDeal = Omit<Deal, "id" | "arn" | "accountArn">

export const action: ActionFunction = async ({ request }) => {
  const body = (await request.json()) as { deals: NewDeal[] }
  const auth = request.headers.get("Authorization") ?? ""
  const token = auth.replace("Bearer ", "")

  if (!token) {
    return new Response("Missing required auth", { status: 401 })
  }

  const account = await db.account.findUnique({
    include: { user: true },
    where: { token },
  })

  if (!account) {
    return new Response("Account not found", { status: 403 })
  }

  // Add the account ARN and generate a deal ARN
  const deals = body.deals.map(async (deal) => ({
    ...deal,
    accountArn: account.arn,
    arn: createArn("deal", account.user.id, await generateId()),
  }))

  // Add the deals to the DB
  await db.deal.createMany({
    data: await Promise.all(deals),
  })

  return new Response(null, { status: 201 })
}
