import invariant from "tiny-invariant"

invariant(process.env.SESSION_SECRET, "SESSION_SECRET must be set")

export const env = {
  betaUsers: process.env.BETA_USERS?.split(",") ?? [],
  prod: process.env.NODE_ENV === "production",
  sessionSecret: process.env.SESSION_SECRET,
}
