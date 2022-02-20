import { Link } from "remix"
import { Document } from "./Document"

export interface ServerErrorProps {
  error: Error
}

export function ServerError({ error }: ServerErrorProps) {
  const message =
    process.env.NODE_ENV === "production" ? (
      "Looks like something went wrong. Please try again or wait a few minutes."
    ) : (
      <code>{error.message}</code>
    )

  return (
    <Document title="Uh-oh!">
      <div className="min-h-full bg-white px-4 py-16 sm:px-6 sm:py-24 md:grid md:place-items-center lg:px-8">
        <div className="mx-auto max-w-max">
          <main className="sm:flex">
            <p className="text-4xl font-extrabold text-primary-600 sm:text-5xl">
              500
            </p>

            <div className="sm:ml-6">
              <div className="sm:border-l sm:border-gray-200 sm:pl-6">
                <h1 className="text-4xl font-extrabold tracking-tight text-gray-900 sm:text-5xl">
                  Internal server error
                </h1>

                <p className="mt-1 max-w-md text-base text-gray-500">
                  {message}
                </p>
              </div>

              <div className="mt-10 flex space-x-3 sm:border-l sm:border-transparent sm:pl-6">
                <Link className="btn-primary" to="/">
                  Go back home
                </Link>

                <a
                  className="btn-secondary"
                  href="https://github.com/mskelton/analyzer/issues/new"
                >
                  Open an issue
                </a>
              </div>
            </div>
          </main>
        </div>
      </div>
    </Document>
  )
}
