import { PrismaClient } from "@prisma/client"

const databaseURL =
  process.env.DATABASE_URL ?? "mongodb://root:local@localhost/analyzer"

export const prisma = new PrismaClient({
  datasources: { db: { url: databaseURL } },
})
