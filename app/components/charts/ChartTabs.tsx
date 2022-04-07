import { Tab } from "@headlessui/react"
import { Account } from "@prisma/client"
import { HiCash, HiTrendingDown, HiTrendingUp } from "react-icons/hi"
import { IconTab } from "../common/tabs/IconTab"
import { BalanceChart } from "./BalanceChart"
import { DrawdownChart } from "./DrawdownChart"
import { ProfitChart } from "./ProfitChart"

export interface ChartTabsProps {
  metrics: NonNullable<Account["metrics"]>
}

export function ChartTabs({ metrics }: ChartTabsProps) {
  return (
    <Tab.Group>
      <Tab.List className="mb-6 flex gap-6 border-b border-gray-200">
        <IconTab icon={<HiTrendingUp />}>Profit</IconTab>
        <IconTab icon={<HiCash />}>Balance</IconTab>
        <IconTab icon={<HiTrendingDown />}>Drawdown</IconTab>
      </Tab.List>

      <Tab.Panels>
        <Tab.Panel>
          <ProfitChart metric={metrics.profit} />
        </Tab.Panel>

        <Tab.Panel>
          <BalanceChart metric={metrics.balance} />
        </Tab.Panel>

        <Tab.Panel>
          <DrawdownChart metric={metrics.drawdown} />
        </Tab.Panel>
      </Tab.Panels>
    </Tab.Group>
  )
}
