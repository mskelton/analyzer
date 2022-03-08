import { Tab } from "@headlessui/react"
import clsx from "clsx"
import { cloneElement, Fragment } from "react"

export interface IconTabProps {
  children: React.ReactNode
  icon: React.ReactElement
}

export function IconTab({ children, icon }: IconTabProps) {
  return (
    <Tab as={Fragment}>
      {({ selected }) => (
        <button
          className={clsx(
            "group -mb-px inline-flex items-center border-b-2 p-3 text-sm font-medium transition-colors",
            selected
              ? "border-primary-500 text-primary-600"
              : "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700"
          )}
        >
          {cloneElement(icon, {
            "aria-hidden": true,
            className: clsx(
              "mr-2 h-5 w-5 transition-colors",
              selected
                ? "text-primary-500"
                : "text-gray-400 group-hover:text-gray-500"
            ),
          })}

          <span>{children}</span>
        </button>
      )}
    </Tab>
  )
}
