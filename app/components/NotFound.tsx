import { Link, useCatch } from "remix"
import { Document } from "./Document"

export function NotFound() {
  const caught = useCatch()

  return (
    <Document title={`${caught.status} ${caught.statusText}`}>
      <div className="flex h-full flex-col items-center justify-center">
        <div className="flex">
          <h1 className="border-r-1 pr-3 text-4xl font-extrabold text-primary-600">
            404
          </h1>

          <div className="max-w-md">
            <p className="mb-4 text-xl font-bold leading-normal md:text-2xl">
              Sorry we couldn&rsquo;t find this page.
            </p>

            <p className="mb-8">
              But dont worry, you can find plenty of other things on our
              homepage.
            </p>
          </div>
        </div>

        <Link className="btn-primary" to="/">
          Back to homepage
        </Link>
      </div>
    </Document>
  )
}
