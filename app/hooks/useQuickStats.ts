import { Metric } from "@prisma/client"
import { QuickStatProps } from "~/components/charts/QuickStat"
import { sum } from "~/utils/math"
import { findByKey, formatCurrency, formatPercentage } from "~/utils/metrics"

function getStatInfo(
  metric: Metric,
  format: (value: number) => string
): Pick<QuickStatProps, "change" | "value" | "type"> {
  const value = metric.value as number[]
  const total = sum(value)
  const thisWeek = sum(value.slice(-7))

  return {
    change: format(thisWeek),
    type: thisWeek >= 0 ? "increase" : "decrease",
    value: format(total),
  }
}

export function useQuickStats(metrics: Metric[]) {
  const balance = getStatInfo(findByKey(metrics, "BALANCE"), formatCurrency)
  const profit = getStatInfo(findByKey(metrics, "PROFIT"), formatPercentage)

  return {
    balance,
    drawdown: null as any,
    profit,
  }
}
