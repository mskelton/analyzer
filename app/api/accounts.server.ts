import { Account } from "@prisma/client"
import invariant from "tiny-invariant"
import { db } from "~/db/db.server"
import { generateId } from "~/utils/id.server"
import { getUserId } from "~/utils/session.server"

export function getAccounts(userId: string) {
  return db.account.findMany({ where: { userId } })
}

export function getAccount(externalId: string) {
  return db.account.findUnique({ where: { externalId } })
}

export type EditableAccountData = Pick<Account, "broker" | "name" | "type">

export async function validateAccountData(
  formData: FormData
): Promise<EditableAccountData> {
  const name = formData.get("name")
  const broker = formData.get("broker")
  const type = formData.get("type")

  // Validate form data
  invariant(typeof name === "string")
  invariant(typeof broker === "string")
  invariant(type === "DEMO" || type === "LIVE")

  return { broker, name, type }
}

export async function createAccount(
  request: Request,
  data: EditableAccountData
) {
  return db.account.create({
    data: {
      ...data,
      externalId: await generateId(),
      userId: await getUserId(request),
    },
  })
}

export async function updateAccount(
  externalId: string,
  data: EditableAccountData
) {
  return db.account.update({ data, where: { externalId } })
}

export async function deleteAccount(externalId: string) {
  return db.account.delete({ where: { externalId } })
}
