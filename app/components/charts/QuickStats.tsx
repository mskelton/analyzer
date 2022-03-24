import { Account } from "@prisma/client"
import { HiCash, HiTrendingDown, HiTrendingUp } from "react-icons/hi"
import { useQuickStats } from "~/hooks/useQuickStats"
import { QuickStat } from "./QuickStat"

export interface QuickStatsProps {
  metrics: NonNullable<Account["metrics"]>
}

export function QuickStats({ metrics }: QuickStatsProps) {
  const { balance, drawdown, profit } = useQuickStats(metrics)

  return (
    <dl className="col-span-12 grid grid-cols-12 gap-4">
      <QuickStat icon={<HiTrendingUp />} name="Profit" {...profit} />
      <QuickStat icon={<HiCash />} name="Balance" {...balance} />
      <QuickStat icon={<HiTrendingDown />} name="Drawdown" {...drawdown} />
    </dl>
  )
}
