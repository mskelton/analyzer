import { LoaderFunction, Outlet } from "remix"
import { getUser } from "~/api/user.server"
import { Nav } from "~/components/nav/Nav"
import { gravatar } from "~/utils/gravatar.server"
import { getUserArn } from "~/utils/session.server"

export const loader: LoaderFunction = async ({ request }) => {
  const userArn = await getUserArn(request)
  const user = await getUser(userArn)

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
