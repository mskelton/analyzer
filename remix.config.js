const prod = process.env.NODE_ENV === "production"

/** @type {import('@remix-run/dev/config').AppConfig} */
module.exports = {
  publicPath: prod ? "/analyzer/build/" : "/build/",
  // When running locally in development mode, we use the built in remix server.
  server: prod ? "./server.js" : undefined,
  serverBuildTarget: "vercel",
}
