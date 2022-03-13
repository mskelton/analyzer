import invariant from "tiny-invariant"

invariant(process.env.SESSION_SECRET, "SESSION_SECRET must be set")
invariant(process.env.MAILGUN_SENDING_KEY, "MAILGUN_SENDING_KEY must be set")

export const env = {
  betaUsers: process.env.BETA_USERS?.split(",") ?? [],
  mailgunSendingKey: process.env.MAILGUN_SENDING_KEY,
  prod: process.env.NODE_ENV === "production",
  sessionSecret: process.env.SESSION_SECRET,
}
