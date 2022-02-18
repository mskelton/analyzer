import { ReactNode } from "react"
import { Links, LiveReload, Meta, Scripts } from "remix"

export interface DocumentProps {
  children: ReactNode
  title?: string
}

export function Document({ children, title }: DocumentProps) {
  return (
    <html className="h-full bg-gray-50" lang="en">
      <head>
        <Meta />
        {title && <title>{title}</title>}
        <Links />
      </head>
      <body className="h-full">
        {children}
        <Scripts />
        <LiveReload />
      </body>
    </html>
  )
}
