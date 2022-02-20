import { createHash } from "crypto"

const md5 = createHash("md5")

export function gravatar(email: string) {
  const cleanedEmail = email.trim().toLowerCase()
  const hash = md5.update(cleanedEmail).digest("hex")

  return `https://www.gravatar.com/avatar/${hash}?d=identicon`
}
