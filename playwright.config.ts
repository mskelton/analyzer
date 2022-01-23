import { Config } from "@playwright/test"

const config: Config = {
  forbidOnly: !!process.env.CI,
  projects: [
    { name: "e2e", testDir: "./test/spec/e2e" },
    { name: "integ", testDir: "./test/spec/integ" },
  ],
}

export default config
