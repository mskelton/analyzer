import { createCookieSessionStorage, redirect } from "remix"
import { parseArn } from "./arn"

const prod = process.env.NODE_ENV === "production"

export const storage = createCookieSessionStorage({
  cookie: {
    domain: prod ? "mskelton.dev" : undefined,
    httpOnly: true,
    maxAge: 60 * 60 * 24 * 7,
    name: "__session",
    path: prod ? "/analyzer" : "/",
    sameSite: "lax",
    secrets: [process.env.SESSION_SECRET!],
    secure: true,
  },
})

export function getUserSession(request: Request) {
  return storage.getSession(request.headers.get("Cookie"))
}

export async function getUserArn<T extends boolean = true>(
  request: Request,
  throwIfMissing?: T
): Promise<T extends true ? string : string | undefined> {
  const session = await getUserSession(request)
  const arn = session.get("userArn") as string | undefined

  if (throwIfMissing && !arn) {
    throw redirect("/login")
  }

  return arn!
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
