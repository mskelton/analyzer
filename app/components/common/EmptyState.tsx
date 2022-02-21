import { HiFolderAdd } from "react-icons/hi"

export interface EmptyStateProps {
  description: string
  title: string
}

export function EmptyState({ description, title }: EmptyStateProps) {
  return (
    <div className="mt-5 text-center">
      <HiFolderAdd className="mx-auto h-12 w-12 text-gray-400" />

      <h3 className="mt-2 text-sm font-medium text-gray-900">{title}</h3>
      <p className="mt-2 text-sm text-gray-500">{description}</p>
    </div>
  )
}
