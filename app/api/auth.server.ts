import * as bcrypt from "bcrypt"
import { db } from "~/db.server"
import { createArn } from "~/utils/arn"
import { ClientError } from "~/utils/errors.server"
import { generateId } from "~/utils/id.server"

export async function login(email: string, password: string) {
  const user = await db.user.findUnique({ where: { email } })

  if (user && (await bcrypt.compare(password, user.password))) {
    return user
  }

  throw new ClientError("Invalid email or password")
}

export async function signUp(name: string, email: string, password: string) {
  const user = await db.user.findUnique({ where: { email } })

  if (user) {
    throw new ClientError("User already exists")
  }

  return db.user.create({
    data: {
      arn: createArn("user", await generateId(), ""),
      email,
      name,
      password: await bcrypt.hash(password, 10),
    },
  })
}
