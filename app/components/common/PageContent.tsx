export interface PageContentProps {
  children?: React.ReactNode
}

export function PageContent({ children }: PageContentProps) {
  return (
    <main className="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
      {children}
    </main>
  )
}
