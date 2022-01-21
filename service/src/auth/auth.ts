import * as Router from "@koa/router"

export const router = new Router({ prefix: "/auth" })

router.get("/", (ctx) => {
  ctx.body = "auth"
})
