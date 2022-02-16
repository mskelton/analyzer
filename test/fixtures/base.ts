import { test as base } from "@playwright/test"

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface BaseFixtures {}

export const test = base.extend<BaseFixtures>({})
