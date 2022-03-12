import { User } from "@prisma/client"
import { redirect } from "remix"
import invariant from "tiny-invariant"
import { db } from "~/db.server"
import { getUserArn } from "~/utils/session.server"

export async function getUser(request: Request) {
  const arn = await getUserArn(request)
  const user = await db.user.findUnique({ where: { arn } })

  if (!user) {
    throw redirect("/login")
  }

  return user
}

export type EditableUserData = Pick<User, "name" | "email">

export async function validateUserData(
  formData: FormData
): Promise<EditableUserData> {
  const name = formData.get("name")
  const email = formData.get("email")

  // Validate form data
  invariant(typeof name === "string")
  invariant(typeof email === "string")

  return { email, name }
}

export async function updateUser(arn: string, data: EditableUserData) {
  return db.user.update({ data, where: { arn } })
}

export async function deleteUser(arn: string) {
  return db.user.delete({ where: { arn } })
}
