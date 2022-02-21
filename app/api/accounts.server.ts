import { Account } from "@prisma/client"
import { nanoid } from "nanoid/async"
import { db } from "~/db/db.server"
import { getUserId } from "~/utils/session.server"

export function getAccounts(userId: string) {
  return db.account.findMany({ where: { userId } })
}

export async function createAccount(
  request: Request,
  data: Pick<Account, "broker" | "name" | "type">
) {
  return db.account.create({
    data: {
      ...data,
      externalId: await nanoid(8),
      userId: await getUserId(request),
    },
  })
}
