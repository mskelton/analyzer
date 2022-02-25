import clsx from "clsx"
import { HiArrowSmUp } from "react-icons/hi"

interface Stat {
  change: string
  changeType: string
  name: string
  previousStat: number
  stat: number
}

export interface StatProps {
  stats: Stat[]
  title: string
}

export function Stat({ stats, title }: StatProps) {
  return (
    <div>
      <h3 className="text-lg font-medium leading-6 text-gray-900">
        Last 30 days
      </h3>

      <dl className="mt-5 grid grid-cols-1 divide-y divide-gray-200 overflow-hidden rounded-lg bg-white shadow md:grid-cols-3 md:divide-y-0 md:divide-x">
        {stats.map((item) => (
          <div key={item.name} className="px-4 py-5 sm:p-6">
            <dt className="text-base font-normal text-gray-900">{item.name}</dt>
            <dd className="mt-1 flex items-baseline justify-between md:block lg:flex">
              <div className="flex items-baseline text-2xl font-semibold text-indigo-600">
                {item.stat}
                <span className="ml-2 text-sm font-medium text-gray-500">
                  from {item.previousStat}
                </span>
              </div>

              <div
                className={clsx(
                  item.changeType === "increase"
                    ? "bg-green-100 text-green-800"
                    : "bg-red-100 text-red-800",
                  "inline-flex items-baseline rounded-full px-2.5 py-0.5 text-sm font-medium md:mt-2 lg:mt-0"
                )}
              >
                <HiArrowSmUp
                  aria-hidden="true"
                  className={clsx(
                    "-ml-1 mr-0.5 h-5 w-5 flex-shrink-0 self-center",
                    item.changeType === "increase"
                      ? "text-green-500"
                      : "rotate-180 text-red-500"
                  )}
                />

                <span className="sr-only">
                  {item.changeType === "increase" ? "Increased" : "Decreased"}{" "}
                  by
                </span>
                {item.change}
              </div>
            </dd>
          </div>
        ))}
      </dl>
    </div>
  )
}
