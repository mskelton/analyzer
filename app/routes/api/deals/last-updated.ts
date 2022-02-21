import { LoaderFunction } from "remix"
import { getAccountFromToken } from "~/api/accounts.server"

export const loader: LoaderFunction = async ({ request }) => {
  const account = await getAccountFromToken(request)
  const lastUpdated = "0"

  return new Response(lastUpdated, {
    headers: { "Content-Type": "text/plain" },
    status: 200,
  })
}
