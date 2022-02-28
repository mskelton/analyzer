import { HiFolderAdd } from "react-icons/hi"
import { EmptyState } from "../common/EmptyState"

export interface NoAccountsProps {
  children?: React.ReactNode
}

export function NoAccounts({ children }: NoAccountsProps) {
  return (
    <EmptyState
      description="Add your first account to get started with Analyzer."
      icon={<HiFolderAdd />}
      title="No accounts"
    >
      {children}
    </EmptyState>
  )
}
