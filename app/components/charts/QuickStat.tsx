import clsx from "clsx"
import { cloneElement } from "react"
import { HiArrowSmDown, HiArrowSmUp } from "react-icons/hi"

export interface QuickStatProps {
  change: string
  comingSoon?: boolean
  icon: React.ReactElement
  name: string
  type: "increase" | "decrease"
  value: string
}

export function QuickStat({
  change,
  comingSoon,
  icon,
  name,
  type,
  value,
}: QuickStatProps) {
  const increase = type === "increase"
  const ChangeIcon = increase ? HiArrowSmUp : HiArrowSmDown

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
          <p className="text-2xl font-semibold text-gray-900">
            {comingSoon ? "Coming soon!" : value}
          </p>

          {!comingSoon && (
            <p
              className={clsx(
                "ml-2 flex items-baseline text-sm font-semibold",
                increase ? "text-green-600" : "text-red-600"
              )}
            >
              <ChangeIcon
                aria-hidden="true"
                className={clsx(
                  "h-5 w-5 flex-shrink-0 self-center",
                  increase ? "text-green-500" : "text-red-500"
                )}
              />

              <span className="sr-only">
                {increase ? "Increased" : "Decreased"} by
              </span>
              {change}
            </p>
          )}
        </dd>
      </div>
    </div>
  )
}
