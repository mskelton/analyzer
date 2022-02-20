import { useLoaderData } from "remix"

export interface AppLoaderData {
  user: { avatar: string }
}

export function useAppData() {
  return useLoaderData<AppLoaderData>()
}
