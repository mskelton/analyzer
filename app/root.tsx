import { LinksFunction, MetaFunction, Outlet, useCatch } from "remix"
import { Document } from "./components/Document"
import { NotFound } from "./components/NotFound"
import { ServerError } from "./components/ServerError"
import stylesUrl from "./tailwind.css"

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
  return {
    charset: "utf-8",
    "og:site_name": "Analyzer",
    "og:type": "website",
    "og:url": "https://mskelton.dev/analyzer" + location.pathname,
    robots: "follow, index",
    "twitter:card": "summary",
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

  return <ServerError error={error} />
}

export default function App() {
  return (
    <Document title="Analyzer">
      <Outlet />
    </Document>
  )
}
