import { createCookieSessionStorage, redirect } from "remix"
import { parseArn } from "./arn"
import { env } from "./env.server"

export const storage = createCookieSessionStorage({
  cookie: {
    domain: env.prod ? "analyzer.mskelton.dev" : undefined,
    httpOnly: true,
    maxAge: 60 * 60 * 24 * 7,
    name: "__session",
    path: "/",
    sameSite: "lax",
    secrets: [env.sessionSecret],
    secure: true,
  },
})

export function getUserSession(request: Request) {
  return storage.getSession(request.headers.get("Cookie"))
}

export async function getUserArn<T extends boolean = false>(
  request: Request,
  dontThrow?: T
): Promise<T extends false ? string : string | undefined> {
  const session = await getUserSession(request)
  const arn = session.get("userArn") as string | undefined

  if (dontThrow || arn) {
    return arn!
  }

  throw redirect("/login")
}

export async function getUserId(request: Request) {
  return parseArn(await getUserArn(request)).userId
}

export async function commitUser(request: Request, userArn: string) {
  const session = await getUserSession(request)
  session.set("userArn", userArn)

  return redirect("/dashboard", {
    headers: {
      "Set-Cookie": await storage.commitSession(session),
    },
  })
}
