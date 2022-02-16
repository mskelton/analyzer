import { Config } from "@playwright/test"

const config: Config = {
  forbidOnly: !!process.env.CI,
}

export default config
