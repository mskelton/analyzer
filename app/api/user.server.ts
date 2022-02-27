import { db } from "~/db.server"
import { ClientError } from "~/utils/errors.server"
import { getUserArn } from "~/utils/session.server"

export async function getUser(request: Request) {
  const arn = await getUserArn(request)
  const user = await db.user.findUnique({ where: { arn } })

  if (!user) {
    throw new ClientError("User not found")
  }

  return user
}
