import { DrawdownMetric } from "@prisma/client"
import { useMemo } from "react"
import { Line } from "react-chartjs-2"
import { addDays, formatDate, midnight } from "~/utils/date"
import { formatPercentage } from "~/utils/metrics"

export interface DrawdownChartProps {
  metric: DrawdownMetric | null
}

export function DrawdownChart({ metric }: DrawdownChartProps) {
  const data = useMemo(() => {
    const value = (metric?.value ?? []).map((val) => -val)
    const end = midnight(metric?.updatedAt ?? new Date())

    return {
      datasets: [{ borderColor: "#0d9488", data: value, label: "Drawdown" }],
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
                `${ctx.dataset.label}: ${formatPercentage(ctx.parsed.y)}`,
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
              callback: (value) => formatPercentage(value as number),
            },
          },
        },
      }}
    />
  )
}
