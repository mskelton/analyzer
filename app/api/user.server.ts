import { db } from "~/db/db.server"

export function getUser(arn: string) {
  return db.user.findUnique({
    rejectOnNotFound: true,
    where: { arn },
  })
}
