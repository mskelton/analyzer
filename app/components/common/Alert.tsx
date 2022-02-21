import { HiCheckCircle, HiExclamation, HiXCircle } from "react-icons/hi"

const colors = {
  danger: "bg-red-50 text-red-800",
  success: "bg-green-50 text-green-800",
  warning: "bg-amber-50 text-amber-800",
}

const icons = {
  danger: <HiXCircle className="text-red-400" />,
  success: <HiCheckCircle className="text-green-400" />,
  warning: <HiExclamation className="text-amber-400" />,
}

export interface BadgeProps {
  children: React.ReactNode
  className?: string
  type: "success" | "warning" | "danger"
}

export function Alert({ children, className, type }: BadgeProps) {
  return (
    <div className={`${className} ${colors[type]} flex gap-3 rounded-md p-4`}>
      <span className="h-5 w-5 flex-shrink-0">{icons[type]}</span>
      <p className="text-sm font-medium">{children}</p>
    </div>
  )
}
