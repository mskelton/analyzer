import { Menu } from "@headlessui/react"
import clsx from "clsx"

export interface MenuItemProps extends React.HTMLAttributes<HTMLElement> {
  as?: React.ElementType
  href?: string
}

export function MenuItem({
  as: Component = "a",
  className,
  ...props
}: MenuItemProps) {
  return (
    <Menu.Item>
      {({ active }) => (
        <Component
          className={clsx(
            "block px-4 py-2 text-sm text-gray-700",
            active && "bg-gray-100",
            className
          )}
          {...props}
        />
      )}
    </Menu.Item>
  )
}
