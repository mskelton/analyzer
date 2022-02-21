import { createCookieSessionStorage, redirect } from "remix"

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

export async function getUserArn(request: Request): Promise<string | null> {
  const session = await getUserSession(request)
  return session.get("userArn") ?? null
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

export async function requireUser(request: Request) {
  const userArn = await getUserArn(request)

  if (!userArn) {
    throw redirect("/login")
  }

  return userArn
}
