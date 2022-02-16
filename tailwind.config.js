const defaultTheme = require("tailwindcss/defaultTheme")
const colors = require("tailwindcss/colors")

/** @type {import('tailwindcss/tailwind-config').TailwindConfig} */
module.exports = {
  content: ["./app/**/*.{ts,tsx}"],
  darkMode: "media",
  plugins: [require("@tailwindcss/forms")],
  theme: {
    extend: {
      colors: {
        gray: colors.neutral,
        primary: colors.indigo,
      },
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
}
