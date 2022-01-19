import { test as base } from "@playwright/test"
import { API } from "api"

interface BaseFixtures {
  api: API
}

export const test = base.extend<BaseFixtures>({
  api: async ({}, use) => {
    await use(new API())
  },
})
