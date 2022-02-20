import { db } from "~/db/db.server"

export function getAccounts(userId: string) {
  return db.account.findMany({ where: { userId } })
}
