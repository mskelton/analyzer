import { createHmac } from "crypto"
import { redirect } from "remix"
import { env } from "./env.server"

export const hmac = (data: string) =>
  createHmac("sha256", env.hmacSecret).update(data).digest("hex")

const errors = {
  expired: `Password reset link has expired. Please request a new password reset link.`,
  invalidSignature: `Password reset signature is invalid. Please request a new password reset link.`,
}

/**
 * Validates a URL matches a it's HMAC signature and has not expired
 */
export function validateURL(url: URL) {
  const [prefix, signature] = url.href.split("&signature=")
  const expires = +(url.searchParams?.get("expires") ?? 0)

  // Validate the URL signature is valid
  if (signature !== hmac(prefix)) {
    throw redirect(`/forgot-password?error=${errors.invalidSignature}`)
  }

  // Validate the URL hasn't expired
  if (Date.now() >= expires) {
    throw redirect(`/forgot-password?error=${errors.expired}`)
  }

  return null
}
