import { ReactNode } from "react"

export interface AuthCardProps {
  children: ReactNode
}

export function AuthCard({ children }: AuthCardProps) {
  return (
    <div className="mt-8 bg-white py-8 px-4 shadow sm:mx-auto sm:w-full sm:max-w-md sm:rounded-lg sm:px-10">
      {children}
    </div>
  )
}
