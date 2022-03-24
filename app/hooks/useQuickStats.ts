import { Account, DrawdownMetric } from "@prisma/client"
import { QuickStatProps } from "~/components/charts/QuickStat"
import { sum } from "~/utils/math"
import { formatCurrency, formatPercentage } from "~/utils/metrics"

function getStatInfo(
  value: number[] = [],
  format: (value: number) => string
): Pick<QuickStatProps, "change" | "value" | "trending"> {
  const total = sum(value)
  const thisWeek = sum(value.slice(-7))

  return {
    change: format(thisWeek),
    trending: thisWeek >= 0 ? "up" : "down",
    value: format(total),
  }
}

function getDrawdownInfo(
  metric: DrawdownMetric | null
): Pick<QuickStatProps, "change" | "value" | "trending" | "status"> {
  const yesterday = metric?.value?.at(-2) ?? 0
  const current = metric?.current ?? 0

  return {
    change: formatPercentage(current - yesterday),
    status: current > yesterday ? "regression" : "improvement",
    trending: current > yesterday ? "up" : "down",
    value: formatPercentage(current),
  }
}

export function useQuickStats(metrics: NonNullable<Account["metrics"]>) {
  return {
    balance: getStatInfo(metrics.profit?.value, formatCurrency),
    drawdown: getDrawdownInfo(metrics.drawdown),
    profit: getStatInfo(metrics.balance?.value, formatPercentage),
  }
}
