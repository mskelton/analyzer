import { Disclosure } from "@headlessui/react"
import { MenuIcon, XIcon } from "@heroicons/react/outline"

export interface MobileMenuButtonProps {
  open: boolean
}

export function MobileMenuButton({ open }: MobileMenuButtonProps) {
  const Icon = open ? XIcon : MenuIcon

  return (
    <Disclosure.Button className="mr-4 inline-flex items-center justify-center rounded-md bg-gray-800 p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800 md:hidden">
      <span className="sr-only">Open main menu</span>
      <Icon aria-hidden="true" className="block h-6 w-6" />
    </Disclosure.Button>
  )
}
