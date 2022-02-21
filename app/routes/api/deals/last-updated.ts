import { LoaderFunction } from "remix"

export const loader: LoaderFunction = async () => {
  const lastUpdated = "0"

  return new Response(lastUpdated, {
    headers: { "Content-Type": "text/plain" },
    status: 200,
  })
}
