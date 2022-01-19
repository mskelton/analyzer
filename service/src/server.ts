import * as Router from "@koa/router"
import * as Koa from "koa"
import { router as auth } from "./auth"
import { router as ingest } from "./ingest"

const app = new Koa()
const router = new Router()

router.get("/", (ctx) => {
  ctx.body = "Welcome to the Analyzer service!"
})

app
  .use(router.routes())
  .use(router.allowedMethods())
  .use(auth.routes())
  .use(auth.allowedMethods())
  .use(ingest.routes())
  .use(ingest.allowedMethods())
  .listen(3001, () => {
    console.log("🚀 Service listening on http://localhost:3001")
  })
