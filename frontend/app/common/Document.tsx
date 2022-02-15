import { ReactNode } from "react"
import { Links, LiveReload, Meta, Scripts } from "remix"

export interface DocumentProps {
  children: ReactNode
  title?: string
}

export function Document({ children, title }: DocumentProps) {
  return (
    <html lang="en">
      <head>
        <Meta />
        {title && <title>{title}</title>}
        <Links />
      </head>
      <body className="bg-white text-black antialiased dark:bg-gray-900 dark:text-white">
        {children}
        <Scripts />
        {process.env.NODE_ENV === "development" && <LiveReload />}
      </body>
    </html>
  )
}
