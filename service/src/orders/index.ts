import * as Router from "@koa/router"
import { prisma } from "../db"

export const router = new Router({ prefix: "/orders" })

router.get("/last-updated", (ctx) => {
  ctx.body = new Date().getTime()
})

router.get("/:ticket", async (ctx) => {
  const order = await prisma.deal.findUnique({ where: {} })
  // const order = await OrderModel.findOne.byTicket(+ctx.params.ticket).exec()
  // order.timing

  if (order) {
    ctx.body = order
  } else {
    ctx.throw(404, "Order not found")
  }
})

router.post("/", (ctx) => {
  const body = ctx.request.body

  ctx.status = 203
})
