import clsx from "clsx"
import { cloneElement } from "react"
import { HiArrowSmDown, HiArrowSmUp } from "react-icons/hi"

export interface QuickStatProps {
  change: string
  icon: React.ReactElement
  name: string
  status?: "improvement" | "regression"
  trending: "up" | "down"
  value: string
}

export function QuickStat({
  change,
  icon,
  name,
  status: statusProp,
  trending,
  value,
}: QuickStatProps) {
  const ChangeIcon = trending === "up" ? HiArrowSmUp : HiArrowSmDown
  const status =
    statusProp ?? (trending === "up" ? "improvement" : "regression")

  return (
    <div className="col-span-4 flex items-center gap-4 overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:px-6 sm:py-6">
      <div className="rounded-md bg-primary-500 p-3">
        {cloneElement(icon, {
          "aria-hidden": true,
          className: "h-6 w-6 text-white",
        })}
      </div>

      <div>
        <dt className="truncate text-sm font-medium text-gray-500">{name}</dt>

        <dd className="flex items-baseline">
          <p className="text-2xl font-semibold text-gray-900">{value}</p>

          <p
            className={clsx(
              "ml-2 flex items-baseline text-sm font-semibold",
              status === "improvement" ? "text-green-600" : "text-red-600"
            )}
          >
            <ChangeIcon
              aria-hidden="true"
              className={clsx(
                "h-5 w-5 flex-shrink-0 self-center",
                status === "improvement" ? "text-green-500" : "text-red-500"
              )}
            />

            <span className="sr-only">
              {trending === "up" ? "Increased" : "Decreased"} by
            </span>
            {change}
          </p>
        </dd>
      </div>
    </div>
  )
}
