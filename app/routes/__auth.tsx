import { Outlet } from "remix"

export default function AuthLayout() {
  return (
    <div className="flex min-h-full flex-col justify-center py-12 sm:px-6 lg:px-8">
      <Outlet />
    </div>
  )
}
