import { Metric } from "@prisma/client"
import { useMemo } from "react"
import { Line } from "react-chartjs-2"
import { formatCurrency } from "~/utils/currency"
import { addDays, formatDate, midnight } from "~/utils/date"
import { aggregate } from "~/utils/metrics"

export interface BalanceChartProps {
  metric: Metric
}

export function BalanceChart({ metric }: BalanceChartProps) {
  const data = useMemo(() => {
    const value = aggregate(metric.value as number[])
    const end = midnight(metric.updatedAt)

    return {
      datasets: [{ borderColor: "#0d9488", data: value, label: "Balance" }],
      labels: value.map((_, i, arr) =>
        formatDate(addDays(end, -arr.length + i + 1))
      ),
    }
  }, [metric])

  return (
    <Line
      data={data}
      options={{
        interaction: {
          intersect: false,
          mode: "index",
        },
        plugins: {
          tooltip: {
            boxPadding: 4,
            callbacks: {
              label: (ctx) =>
                `${ctx.dataset.label}: ${formatCurrency(ctx.parsed.y)}`,
            },
            caretPadding: 4,
            padding: 8,
          },
        },
        scales: {
          x: {
            ticks: {
              autoSkip: true,
              autoSkipPadding: 10,
            },
          },
          y: {
            ticks: {
              callback: (value) => formatCurrency(value as number, 0),
            },
          },
        },
      }}
    />
  )
}
