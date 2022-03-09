import { PrismaClient } from "@prisma/client"
import { Readable } from "stream"

// This prevents us from making multiple connections to the db when the
// require cache is cleared.
declare global {
  // eslint-disable-next-line no-var
  var __db__: PrismaClient | undefined
}

global.__db__ ??= new PrismaClient()

export const db = global.__db__

/**
 * Helper function to stream results from the database when paging through
 * large datasets. Data is loading incrementally in batches.
 */
export function streamFromDB<T extends { id: string }[]>(
  load: (cursor: { id: string } | undefined) => Promise<T>
) {
  let cursor: string | undefined

  return new Readable({
    objectMode: true,
    async read() {
      try {
        const items = await load(cursor ? { id: cursor } : undefined)

        if (items.length) {
          items.forEach((item) => this.push(item))
          cursor = items[items.length - 1].id
        } else {
          this.push(null)
        }
      } catch (err) {
        this.destroy(err as Error)
      }
    },
  })
}
