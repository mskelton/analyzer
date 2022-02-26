import { Metric } from "@prisma/client"
import {
  CategoryScale,
  Chart,
  LinearScale,
  LineElement,
  PointElement,
  Tooltip,
} from "chart.js"
import { useMemo } from "react"
import { Line } from "react-chartjs-2"
import { formatCurrency } from "~/utils/currency"
import { addDays, formatDate, midnight } from "~/utils/date"

Chart.register(CategoryScale, LinearScale, PointElement, LineElement, Tooltip)

export interface BalanceProps {
  metric: Metric
}

export function Balance({ metric }: BalanceProps) {
  const data = useMemo(() => {
    const value = metric.value as number[]
    const end = midnight(metric.updatedAt)

    return {
      datasets: [
        {
          borderColor: "rgb(75, 192, 192)",
          data: value,
          label: "Balance",
          tension: 0.1,
        },
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
              callback: (value) => formatCurrency(value as number),
            },
          },
        },
      }}
    />
  )
}
