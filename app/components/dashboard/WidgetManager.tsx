import "~/components/charts/register"
import { Account } from "@prisma/client"
import { BalanceChart } from "../charts/BalanceChart"
import { ProfitChart } from "../charts/ProfitChart"
import { Widget } from "./Widget"

export interface WidgetManagerProps {
  metrics: Account["metrics"]
}

export function WidgetManager({ metrics }: WidgetManagerProps) {
  return (
    <div className="grid grid-cols-12 gap-4">
      <Widget title="Account balance">
        <BalanceChart metric={metrics.find((m) => m.key === "BALANCE")!} />
      </Widget>

      <Widget title="Profit">
        <ProfitChart metric={metrics.find((m) => m.key === "PROFIT")!} />
      </Widget>
    </div>
  )
}
