import { redirect } from "remix"
import { createHmac } from "node:crypto"
import { env } from "./env.server"

export const hmac = (data: string) =>
  createHmac("sha256", env.hmacSecret).update(data).digest("hex")

/**
 * Validates a URL matches a it's HMAC signature and has not expired
 */
export function validateURL(url: URL) {
  const [prefix, signature] = url.href.split("&signature=")
  const expires = +(url.searchParams?.get("expires") ?? 0)

  // Validate the URL signature is valid
  if (signature !== hmac(prefix)) {
    throw redirect("/forgot-password?error=invalid-signature")
  }

  // Validate the URL hasn't expired
  if (Date.now() >= expires) {
    throw redirect("/forgot-password?error=link-expired")
  }

  return null
}
