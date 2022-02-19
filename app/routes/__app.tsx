import { LoaderFunction, Outlet } from "remix"
import { Nav } from "~/components/nav/Nav"
import { requireUser } from "~/utils/session.server"

export const loader: LoaderFunction = async ({ request }) => {
  await requireUser(request)

  return null
}

export default function App() {
  return (
    <div className="min-h-full">
      <Nav />
      <Outlet />
    </div>
  )
}
