import type { ActionFunction, LoaderFunction } from "remix"
import { redirect } from "remix"
import { getUserSession, storage } from "~/utils/session.server"

export const action: ActionFunction = async ({ request }) => {
  const session = await getUserSession(request)

  return redirect("/login", {
    headers: {
      "Set-Cookie": await storage.destroySession(session),
    },
  })
}

export const loader: LoaderFunction = async () => {
  // To protect against a CSRF logout attack, we only allow logging out via
  // a POST request to the logout route.
  return redirect("/")
}
