import { PlaywrightTestConfig } from "@playwright/test"
import path from "path"

const config: PlaywrightTestConfig = {
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 3 : 1,
  testDir: path.join(__dirname, "./test/spec"),
  use: {
    screenshot: "only-on-failure",
    trace: "on-first-retry",
  },
}

export default config
