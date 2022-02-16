import { ReactNode } from "react"

export interface AuthCardProps {
  children: ReactNode
}

export function AuthCard({ children }: AuthCardProps) {
  return (
    <div className="mt-8 rounded-md bg-white p-8 shadow-md">{children}</div>
  )
}
