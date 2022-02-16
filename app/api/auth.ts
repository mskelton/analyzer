import * as bcrypt from "bcrypt"
import { prisma } from "~/db"

export async function login(email: string, password: string) {
  const user = await prisma.user.findUnique({ where: { email } })

  if (user && (await bcrypt.compare(password, user.password))) {
    return user
  }

  throw new Error("Login failed, invalid email or password.")
}

export async function signUp(name: string, email: string, password: string) {
  const user = await prisma.user.findUnique({ where: { email } })

  if (user) {
    throw new Error("Email is invalid or already taken.")
  }

  const salt = await bcrypt.genSalt(10)
  const hash = await bcrypt.hash(password, salt)

  await prisma.user.create({
    data: { email, name, password: hash },
  })
}
