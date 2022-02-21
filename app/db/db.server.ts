import { PrismaClient } from "@prisma/client"

// This prevents us from making multiple connections to the db when the
// require cache is cleared.
declare global {
  // eslint-disable-next-line no-var
  var _prisma: PrismaClient | undefined
}

global._prisma ??= new PrismaClient()

export const db = global._prisma
