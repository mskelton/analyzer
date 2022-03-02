const lightCodeTheme = require("prism-react-renderer/themes/github")
const darkCodeTheme = require("prism-react-renderer/themes/dracula")

module.exports = {
  baseUrl: "/docs/",
  favicon: "img/favicon.ico",
  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",
  organizationName: "mskelton",
  presets: [
    [
      "classic",
      {
        blog: false,
        docs: {
          editUrl: `https://github.com/mskelton/analyzer/tree/main/docs/`,
          routeBasePath: "/",
        },
      },
    ],
  ],
  projectName: "analyzer",
  themeConfig: {
    footer: {
      copyright: `Copyright © ${new Date().getFullYear()} Mark Skelton. Built with Docusaurus.`,
      style: "dark",
    },
    navbar: {
      items: [
        {
          href: "https://github.com/mskelton/analyzer/tree/main/docs",
          label: "GitHub",
          position: "right",
        },
      ],
      logo: {
        alt: "Analyzer logo",
        src: "img/logo.svg",
      },
      title: "Analyzer docs",
    },
    prism: {
      darkTheme: darkCodeTheme,
      theme: lightCodeTheme,
    },
  },
  title: "Analyzer docs",
  url: "https://analyzer.mskelton.dev",
}
