import { ReactNode } from "react"
import { IconContext } from "react-icons"
import { Links, LiveReload, Meta, Scripts } from "remix"

export interface DocumentProps {
  children: ReactNode
  title?: string
}

export function Document({ children, title }: DocumentProps) {
  return (
    <html className="h-full bg-gray-100" lang="en">
      <head>
        <Meta />
        {title && <title>{title}</title>}
        <Links />
      </head>
      <body className="h-full">
        <IconContext.Provider value={{ size: "inherit" }}>
          {children}
        </IconContext.Provider>

        <Scripts />
        <LiveReload />
      </body>
    </html>
  )
}
