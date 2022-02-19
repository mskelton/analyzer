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

export async function getUserId(request: Request) {
  const session = await getUserSession(request)
  return session.get("userId") ?? null
}

export async function requireUser(request: Request) {
  const userId = await getUserId(request)

  if (!userId) {
    throw redirect("/login")
  }

  return null
}
