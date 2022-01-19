import { test as base } from "@playwright/test"
import { AnalyzerClient } from "api"

interface BaseFixtures {
  client: AnalyzerClient
}

export const test = base.extend<BaseFixtures>({
  client: async ({}, use) => {
    await use(new AnalyzerClient())
  },
})
