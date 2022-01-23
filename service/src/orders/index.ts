import * as Router from "@koa/router"
import { OrderModel } from "../db/orders"

export const router = new Router({ prefix: "/orders" })

router.get("/:ticket", async (ctx) => {
  const order = await OrderModel.findOne.byTicket(+ctx.params.ticket).exec()

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
