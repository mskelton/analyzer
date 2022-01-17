import * as Router from "@koa/router"
import * as Koa from "koa"
import { router as injest } from "./injest"

const app = new Koa()
const router = new Router()

router.get("/", (ctx) => {
  ctx.body = "Welcome to the Analyzer service!"
})

app
  .use(router.routes())
  .use(router.allowedMethods())
  .use(injest.routes())
  .use(injest.allowedMethods())
  .listen(3000, () => {
    console.log("🚀 Service listening on http://localhost:3000")
  })
