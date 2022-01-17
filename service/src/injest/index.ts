import * as Router from "@koa/router"

export const router = new Router({ prefix: "/injest" })

router.get("/", (ctx) => {
  ctx.body = "Injest"
})
