import type { LinksFunction } from "remix"
import { Outlet, useCatch } from "remix"
import { Document } from "./common/Document"

export const links: LinksFunction = () => {
  return [
    {
      crossOrigin: "anonymous",
      href: "https://fonts.gstatic.com",
      rel: "preconnect",
    },
    {
      href: "https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap",
      rel: "stylesheet",
    },
  ]
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
