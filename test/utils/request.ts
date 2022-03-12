import fetch, { RequestInit } from "node-fetch"

export async function request<T>(url: string, init: RequestInit) {
  const res = await fetch(`http://localhost:3000${url}`, init)

  if (!res.ok) {
    throw new Error(`Request failed with status code ${res.status}`)
  }

  const data =
    res.headers.get("Content-Type") === "application/json"
      ? await res.json()
      : await res.text()

  return {
    data: data as T,
    status: res.status,
  }
}

export function json(body: unknown) {
  return {
    body: JSON.stringify(body),
    headers: {
      "Content-Type": "application/json",
    },
  }
}
