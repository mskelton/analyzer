import { json } from "remix"

/**
 * This class represents an error that is safe to send to the client. Generally
 * these are known exceptions that have a static error message that does not
 * include internal server details.
 */
export class ClientError extends Error {}

/**
 * Safely returns a JSON error response without leaking internal details. If the
 * error is a `ClientError` then the error message is returned with a 400 status
 * code. Otherwise, the error is logged to the server console and a generic
 * error and status code of 500 is returned.
 */
export function handleError(err: unknown, fallback = "Internal server error") {
  if (err instanceof ClientError) {
    throw json({ error: err.message }, { status: 400 })
  }

  console.log("Unhandled error: ", err)
  throw json({ error: fallback }, { status: 400 })
}
