import * as Router from "@koa/router"
import { Deal } from "api"
import { prisma } from "../db"

export const router = new Router({ prefix: "/deals" })

router.get("/last-updated", (ctx) => {
  ctx.body = 0
})

router.get("/:ticket", async (ctx) => {
  const deal = await prisma.deal.findUnique({ where: {} })
  // const deal = await DealModel.findOne.byTicket(+ctx.params.ticket).exec()
  // deal.timing

  if (deal) {
    ctx.body = deal
  } else {
    ctx.throw(404, "Deal not found")
  }
})

router.post("/", async (ctx) => {
  const { deals } = ctx.request.body as { deals: Deal[] }

  await prisma.deal.createMany({
    data: deals.map((deal) => ({ ...deal, accountId: "1" })),
  })

  ctx.status = 203
})
