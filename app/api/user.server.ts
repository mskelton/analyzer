import { db } from "~/db/db.server"

export function getUser(id: string) {
  return db.user.findUnique({
    rejectOnNotFound: true,
    where: { id },
  })
}
