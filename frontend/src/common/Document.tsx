import { ReactNode } from "react"

export interface DocumentProps {
  children: ReactNode
  title: string
}

export function Document({ children, title }: DocumentProps) {
  return (
    <html lang="en">
      <head>
        <meta charSet="UTF-8" />
        <meta content="IE=edge" httpEquiv="X-UA-Compatible" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>{title}</title>
      </head>
      <body className="bg-white text-black antialiased dark:bg-gray-900 dark:text-white">
        {children}
      </body>
    </html>
  )
}
