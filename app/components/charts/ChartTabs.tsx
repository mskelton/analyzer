import { Tab } from "@headlessui/react"
import { Account } from "@prisma/client"
import { HiCash, HiTrendingDown, HiTrendingUp } from "react-icons/hi"
import { findByKey } from "~/utils/metrics"
import { IconTab } from "../common/tabs/IconTab"
import { BalanceChart } from "./BalanceChart"
import { ProfitChart } from "./ProfitChart"

export interface ChartTabsProps {
  metrics: Account["metrics"]
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
          <ProfitChart metric={findByKey(metrics, "PROFIT")} />
        </Tab.Panel>

        <Tab.Panel>
          <BalanceChart metric={findByKey(metrics, "BALANCE")} />
        </Tab.Panel>

        <Tab.Panel>Coming soon!</Tab.Panel>
      </Tab.Panels>
    </Tab.Group>
  )
}
