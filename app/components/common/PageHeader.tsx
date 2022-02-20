export interface PageHeaderProps {
  children: string
  extra?: React.ReactNode
}

export function PageHeader({ children, extra }: PageHeaderProps) {
  return (
    <header className="bg-white shadow">
      <div className="mx-auto flex max-w-7xl items-center justify-between py-6 px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900">{children}</h1>
        {extra}
      </div>
    </header>
  )
}
