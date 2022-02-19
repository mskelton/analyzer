import * as bcrypt from "bcrypt"
import { prisma } from "~/db"

export async function login(email: string, password: string) {
  const user = await prisma.user.findUnique({ where: { email } })

  if (user && (await bcrypt.compare(password, user.password))) {
    return user
  }

  throw new Error("Invalid email or password")
}

export async function signUp(name: string, email: string, password: string) {
  const user = await prisma.user.findUnique({ where: { email } })

  if (user) {
    throw new Error("User already exists")
  }

  return prisma.user.create({
    data: {
      email,
      name,
      password: await bcrypt.hash(password, 10),
    },
  })
}
