import { useLoaderData } from "remix"
import { getAccounts } from "~/api/accounts"

export interface AccountsLoaderData {
  accounts: Awaited<ReturnType<typeof getAccounts>>
}

export function useAccounts() {
  return useLoaderData<AccountsLoaderData>()
}
