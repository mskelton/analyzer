import { test as base } from "@playwright/test"

interface BaseFixtures {}

export const test = base.extend<BaseFixtures>({})
