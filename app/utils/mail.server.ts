import { env } from "./env.server"
import { ClientError } from "./errors.server"

const MAILGUN_URL = "https://api.mailgun.net/v3/analyzer.mskelton.dev/messages"
const MAILGUN_AUTH = Buffer.from(`api:${env.mailgunSendingKey}`).toString(
  "base64"
)

export interface MailgunMessage {
  from: string
  subject: string
  text: string
  to: string
}

export async function sendEmail(message: MailgunMessage) {
  const res = await fetch(MAILGUN_URL, {
    body: new URLSearchParams(Object.entries(message)),
    headers: {
      Authorization: `Basic ${MAILGUN_AUTH}`,
    },
    method: "POST",
  })

  if (!res.ok) {
    throw new ClientError("Failed to send email")
  }
}

export function sendForgotPasswordEmail(to: string) {
  const link = "https://analyzer.mskelton.dev"
  const text = `
You are receiving this email because you (or someone else) have requested the reset of a password for your account. Follow the link below to reset your password.

${link}

If you didn't request to reset your password, simply disregard this email. Rest assured, your account is safe.
`.trim()

  return sendEmail({
    from: "Analyzer <mail@analyzer.mskelton.dev>",
    subject: "Reset your password",
    text,
    to,
  })
}
