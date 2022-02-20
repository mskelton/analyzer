export interface BadgeProps {
  children: React.ReactNode
  type: "success" | "warning" | "danger"
}

export function Badge({ children, type }: BadgeProps) {
  const className =
    type === "success"
      ? "bg-green-100 text-green-800"
      : type === "warning"
      ? "bg-yellow-100 text-yellow-800"
      : "bg-red-100 text-red-800"

  return (
    <span
      className={`${className} inline-flex items-center rounded-full px-3 py-0.5 text-sm font-medium`}
    >
      {children}
    </span>
  )
}
