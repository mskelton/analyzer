import { cloneElement } from "react"

export interface EmptyStateProps {
  children?: React.ReactNode
  description: string
  icon: React.ReactElement
  title: string
}

export function EmptyState({
  children,
  description,
  icon,
  title,
}: EmptyStateProps) {
  return (
    <div className="mt-5 text-center">
      {cloneElement(icon, { className: "mx-auto h-12 w-12 text-gray-400" })}

      <h3 className="mt-2 text-sm font-medium text-gray-900">{title}</h3>
      <p className="mt-2 text-sm text-gray-500">{description}</p>

      {children}
    </div>
  )
}
