import { Account } from "@prisma/client"
import { useDashboard } from "~/hooks/useDashboard"
import { Select } from "../common/Select"

export interface AccountSelectProps {
  onChange(account: Account): void
  value: Account | undefined
}

export function AccountSelect({ onChange, value }: AccountSelectProps) {
  const { accounts } = useDashboard()

  return accounts.length < 2 ? null : (
    <div className="w-60 max-w-full">
      <Select
        hideLabel
        label="Account"
        onChange={(value) => onChange(accounts.find((a) => a.id === value)!)}
        options={accounts}
        value={value?.id}
      />
    </div>
  )
}
