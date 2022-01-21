import * as Router from "@koa/router"

export const router = new Router({ prefix: "/orders" })

router.get("/", (ctx) => {
  ctx.body = "Orders"
})
