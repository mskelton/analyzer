import { LoaderFunction, Outlet } from "remix"
import { getUser } from "~/api/user.server"
import { Nav } from "~/components/nav/Nav"
import { gravatar } from "~/utils/gravatar.server"
import { requireUser } from "~/utils/session.server"

export const loader: LoaderFunction = async ({ request }) => {
  const userId = await requireUser(request)
  const user = await getUser(userId)

  return {
    user: { avatar: gravatar(user.email) },
  }
}

export default function App() {
  return (
    <div className="min-h-full">
      <Nav />
      <Outlet />
    </div>
  )
}
