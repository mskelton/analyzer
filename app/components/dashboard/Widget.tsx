export interface WidgetProps {
  children: React.ReactNode
  title: string
}

export function Widget({ children, title }: WidgetProps) {
  return (
    <div className="rounded-md bg-white p-4 shadow-sm">
      <h2 className="mb-6 text-xl font-semibold">{title}</h2>
      <div>{children}</div>
    </div>
  )
}
