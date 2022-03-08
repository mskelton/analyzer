import "~/components/charts/register"
import { Account } from "@prisma/client"
import { ChartTabs } from "../charts/ChartTabs"
import { QuickStats } from "../charts/QuickStats"
import { Widget } from "./Widget"

export interface WidgetManagerProps {
  metrics: Account["metrics"]
}

export function WidgetManager({ metrics }: WidgetManagerProps) {
  return (
    <div className="grid grid-cols-12 gap-4">
      <QuickStats metrics={metrics} />

      <Widget>
        <ChartTabs metrics={metrics} />
      </Widget>
    </div>
  )
}
