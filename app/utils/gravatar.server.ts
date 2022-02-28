import { createHash } from "crypto"

export function gravatar(email: string) {
  const cleanedEmail = email.trim().toLowerCase()
  const hash = createHash("md5").update(cleanedEmail).digest("hex")

  return `https://www.gravatar.com/avatar/${hash}?d=identicon`
}
