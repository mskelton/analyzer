import { test as base } from "@playwright/test"
import { API } from "pw:utils"

export interface BaseFixtures {
  api: API
}

export const test = base.extend<BaseFixtures>({
  api: ({}, use) => use(new API()),
})
