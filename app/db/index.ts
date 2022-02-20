import { PrismaClient } from "@prisma/client"

// This prevents us from making multiple connections to the db when the
// require cache is cleared.
declare global {
  // eslint-disable-next-line no-var
  var _prisma: PrismaClient | undefined
}

const databaseURL =
  process.env.DATABASE_URL ??
  "mongodb://root:local@localhost/analyzer?authSource=admin"

global._prisma ??= new PrismaClient({
  datasources: { db: { url: databaseURL } },
})

export const db = global._prisma
