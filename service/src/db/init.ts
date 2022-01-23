import * as mongoose from "mongoose"

export async function init() {
  await mongoose.connect("mongodb://localhost", {
    auth: {
      password: process.env.DB_PASS ?? "local",
      username: process.env.DB_USER ?? "root",
    },
  })
}
