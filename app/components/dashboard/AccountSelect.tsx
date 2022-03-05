import { Account } from "@prisma/client"
import { useDashboard } from "~/hooks/useDashboard"
import { Select } from "../common/Select"

export interface AccountSelectProps {
  onChange(account: Account): void
  value: Account
}

export function AccountSelect({ onChange, value }: AccountSelectProps) {
  const { accounts } = useDashboard()

  return accounts.length < 2 ? null : (
    <Select
      hideLabel
      label="Account"
      onChange={(value) => {
        onChange(accounts.find((a) => a.id === value)!)
      }}
      options={accounts}
      value={value.id}
    />
  )
}
