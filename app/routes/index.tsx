import { LoaderFunction, redirect } from "remix"
import { getUserArn } from "~/utils/session.server"
import Home from "./home"

export const loader: LoaderFunction = async ({ request }) => {
  // If the user navigates to the root path and they are logged in, redirect to
  // the dashboard. A `/home` route is also defined, which allows logged in
  // users to access the marketing portion of marketing home page. This pattern
  // was inspired by GitHub.
  return (await getUserArn(request)) ? redirect("/dashboard") : null
}

export default Home
