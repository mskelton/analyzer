import { ProfitMetric } from "@prisma/client"
import { useMemo } from "react"
import { Line } from "react-chartjs-2"
import { addDays, formatDate, midnight } from "~/utils/date"
import { round } from "~/utils/math"
import { aggregate } from "~/utils/metrics"

export interface ProfitChartProps {
  metric: ProfitMetric | null
}

export function ProfitChart({ metric }: ProfitChartProps) {
  const data = useMemo(() => {
    const value = aggregate(metric?.value ?? [])
    const end = midnight(metric?.updatedAt ?? new Date())

    return {
      datasets: [
        { borderColor: "rgb(75, 192, 192)", data: value, label: "Profit" },
      ],
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
              label: (ctx) => `${ctx.dataset.label}: ${round(ctx.parsed.y)}%`,
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
              callback: (value) => round(value as number, 0) + "%",
            },
          },
        },
      }}
    />
  )
}
