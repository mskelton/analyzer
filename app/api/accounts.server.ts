import { db } from "~/db"

export function getAccounts(userId: string) {
  return db.account.findMany({ where: { userId } })
}
