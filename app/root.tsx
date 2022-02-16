import type { LinksFunction, MetaFunction } from "remix"
import { Outlet, useCatch } from "remix"
import { Document } from "./components/Document"
import { NotFound } from "./components/NotFound"
import stylesUrl from "./tailwind.css"
import { metadata } from "./utils/metadata"

export const links: LinksFunction = () => {
  return [
    {
      crossOrigin: "anonymous",
      href: "https://fonts.gstatic.com",
      rel: "preconnect",
    },
    {
      href: "https://rsms.me/inter/inter.css",
      rel: "stylesheet",
    },
    {
      href: stylesUrl,
      rel: "stylesheet",
    },
  ]
}

export const meta: MetaFunction = ({ location }) => {
  // const image = metadata.url + metadata.siteLogo

  return {
    charset: "utf-8",
    // "og:image": image,
    "og:site_name": "Analyzer",
    "og:type": "website",
    "og:url": metadata.url + location.pathname,
    robots: "follow, index",
    "twitter:card": "summary",
    // "twitter:image": image,
    "twitter:site": "@mskelton0",
    viewport: "width=device-width, initial-scale=1",
  }
}

export function CatchBoundary() {
  const { status } = useCatch()

  switch (status) {
    case 404:
      return <NotFound />

    default:
      throw new Error(`Unexpected caught response with status: ${status}`)
  }
}

export function ErrorBoundary({ error }: { error: Error }) {
  console.error(error)

  return (
    <Document title="Uh-oh! - Analyzer">
      <h1>App Error</h1>
      <pre>{error.message}</pre>
      <p>
        Replace this UI with what you want users to see when your app throws
        uncaught errors.
      </p>
    </Document>
  )
}

export default function App() {
  return (
    <Document title="Analyzer">
      <Outlet />
    </Document>
  )
}
