import * as Router from "@koa/router"

export const router = new Router({ prefix: "/ingest" })

router.get("/", (ctx) => {
  ctx.body = "Ingest"
})
