/**
 * @type {import('@remix-run/dev/config').AppConfig}
 */
console.log(process.env.NODE_ENV)
module.exports = {
  // When running locally in development mode, we use the built in remix server.
  server: process.env.NODE_ENV === "production" ? "./server.js" : undefined,
  serverBuildTarget: "vercel",
}
