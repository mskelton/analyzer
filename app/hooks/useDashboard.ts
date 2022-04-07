import { Account } from "@prisma/client"
import { useLoaderData } from "remix"

export interface DashboardLoaderData {
  account?: Account
  accounts: Account[]
}

export function useDashboard() {
  return useLoaderData<DashboardLoaderData>()
}
