import {
  CheckCircleIcon,
  ExclamationIcon,
  XCircleIcon,
} from "@heroicons/react/solid"

const colors = {
  danger: "bg-red-100 text-red-800",
  success: "bg-green-100 text-green-800",
  warning: "bg-amber-100 text-amber-800",
}

const icons = {
  danger: <XCircleIcon className="text-red-500" />,
  success: <CheckCircleIcon className="text-green-500" />,
  warning: <ExclamationIcon className="text-amber-500" />,
}

export interface BadgeProps {
  children: React.ReactNode
  className?: string
  type: "success" | "warning" | "danger"
}

export function Alert({ children, className, type }: BadgeProps) {
  return (
    <div
      className={`${className} ${colors[type]} flex items-center gap-2 rounded-md p-4 text-sm`}
    >
      <span className="h-5 w-5">{icons[type]}</span>
      <span>{children}</span>
    </div>
  )
}
