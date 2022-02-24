import { ActionFunction } from "remix"
import { updateMetrics } from "~/api/metrics.server"

export const action: ActionFunction = async ({ request }) => {
  await updateMetrics(request)

  return new Response(null, { status: 204 })
}
