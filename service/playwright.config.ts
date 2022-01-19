import { Config } from "@playwright/test"

const config: Config = {
  forbidOnly: !!process.env.CI,
  testDir: "./test",
}

export default config
