import { Account, User } from "@prisma/client"
import { test as base } from "./base"

export interface DataFixtures {
  account: Account
  user: User
}

export const test = base.extend<DataFixtures>({
  account: async ({ user }, use) => {
    await use({
      arn: "mark",
      createdAt: new Date(),
      id: "1",
      metrics: [],
      name: "mark",
      number: 1,
      token: "yo",
      type: "DEMO",
      updatedAt: new Date(),
      userArn: user.arn,
    })
  },
  user: async ({}, use) => {
    await use({
      arn: "string",
      createdAt: new Date(),
      email: "mark",
      id: "1",
      name: "amrk",
      password: "pass",
      updatedAt: new Date(),
    })
  },
})
