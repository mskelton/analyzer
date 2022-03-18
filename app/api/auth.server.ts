import * as bcrypt from "bcrypt"
import { db } from "~/db.server"
import { createArn } from "~/utils/arn"
import { env } from "~/utils/env.server"
import { ClientError } from "~/utils/errors.server"
import { generateId } from "~/utils/id.server"

export async function login(email: string, password: string) {
  const user = await db.user.findUnique({ where: { email } })

  if (user && (await bcrypt.compare(password, user.password))) {
    return user
  }

  throw new ClientError("Invalid email or password")
}

export function hashPassword(password: string) {
  return bcrypt.hash(password, 10)
}

export async function signUp(name: string, email: string, password: string) {
  const user = await db.user.findUnique({ where: { email } })

  if (user) {
    throw new ClientError("User already exists")
  }

  if (!env.betaUsers.includes(email)) {
    throw new ClientError("User not part of closed beta")
  }

  return db.user.create({
    data: {
      arn: createArn("user", await generateId(), ""),
      email,
      name,
      password: await hashPassword(password),
    },
  })
}
