import clsx from "clsx"

export interface WidgetProps {
  children: React.ReactNode
  noBackground?: boolean
  title?: string
}

export function Widget({ children, noBackground, title }: WidgetProps) {
  return (
    <div
      className={clsx(
        "col-span-12 rounded-md",
        !noBackground && "bg-white p-4 shadow-sm"
      )}
    >
      {title && <h2 className="mb-4 text-xl font-semibold">{title}</h2>}
      <div>{children}</div>
    </div>
  )
}
