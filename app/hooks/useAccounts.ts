import { useLoaderData } from "remix"
import { getAccounts } from "~/api/accounts.server"

export interface AccountsLoaderData {
  accounts: Awaited<ReturnType<typeof getAccounts>>
}

export function useAccounts() {
  return useLoaderData<AccountsLoaderData>()
}
