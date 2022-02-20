import { db } from "~/db"

export function getUser(id: string) {
  return db.user.findUnique({
    rejectOnNotFound: true,
    where: { id },
  })
}
