import * as Router from "@koa/router"
import { prisma } from "../db"

export const router = new Router({ prefix: "/deals" })

router.get("/last-updated", (ctx) => {
  ctx.body = new Date().getTime()
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

router.post("/", (ctx) => {
  const body = ctx.request.body
  console.log(body)

  ctx.status = 203
})
