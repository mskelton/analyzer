export interface BadgeProps {
  children: React.ReactNode
  type: "success" | "warning" | "danger"
}

export function Badge({ children, type }: BadgeProps) {
  const className =
    type === "success"
      ? "bg-green-100 text-green-800"
      : type === "warning"
      ? "bg-amber-100 text-amber-800"
      : "bg-red-100 text-red-800"

  return (
    <span
      className={`${className} inline-flex rounded-full px-2 text-xs font-semibold leading-5`}
    >
      {children}
    </span>
  )
}
