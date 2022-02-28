import { redirect } from "remix"
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
