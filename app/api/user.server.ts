import { prisma } from "~/db"

export async function getUser(id: string) {
  return prisma.user.findUnique({
    rejectOnNotFound: true,
    where: { id },
  })
}
