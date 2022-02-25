import { Account } from "@prisma/client"
import invariant from "tiny-invariant"
import { db } from "~/db.server"
import { createArn, parseArn } from "~/utils/arn"
import { generateId } from "~/utils/id.server"
import { getUserArn, getUserId } from "~/utils/session.server"

export async function getAccounts(request: Request) {
  const userArn = await getUserArn(request)
  return db.account.findMany({ where: { userArn } })
}

export async function getAccount(request: Request, externalId: string) {
  const arn = await getAccountArn(request, externalId)
  return db.account.findUnique({ where: { arn } })
}

export async function getAccountArn(request: Request, externalId: string) {
  return createArn("account", await getUserId(request), externalId)
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
  const userArn = await getUserArn(request)
  const { userId } = parseArn(userArn)
  const arn = createArn("account", userId, await generateId())

  return db.account.create({
    data: {
      ...data,
      arn,
      token: await generateId(12),
      userArn,
    },
  })
}

export async function updateAccount(arn: string, data: EditableAccountData) {
  return db.account.update({ data, where: { arn } })
}

export async function deleteAccount(arn: string) {
  return db.account.delete({ where: { arn } })
}

export async function getAccountFromToken(request: Request) {
  const auth = request.headers.get("Authorization")
  const token = auth?.replace("Bearer ", "")

  if (!token) {
    throw new Response("Missing required auth", { status: 401 })
  }

  const account = await db.account.findUnique({
    where: { token },
  })

  if (!account) {
    throw new Response("Account not found", { status: 403 })
  }

  return account
}
