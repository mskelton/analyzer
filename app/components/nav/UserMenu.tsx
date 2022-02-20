import { Menu, Transition } from "@headlessui/react"
import { useAppData } from "~/hooks/useAppData"
import { MenuItem } from "./MenuItem"

export function UserMenu() {
  const { user } = useAppData()

  return (
    <Menu as="div" className="relative">
      <Menu.Button className="flex max-w-xs items-center rounded-full bg-gray-800 text-sm focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-offset-2 focus-visible:ring-offset-gray-800">
        <span className="sr-only">Open user menu</span>
        <img alt="" className="h-8 w-8 rounded-full" src={user.avatar} />
      </Menu.Button>

      <Transition
        action="/logout"
        as="form"
        enter="transition ease-out duration-100"
        enterFrom="transform opacity-0 scale-95"
        enterTo="transform opacity-100 scale-100"
        leave="transition ease-in duration-75"
        leaveFrom="transform opacity-100 scale-100"
        leaveTo="transform opacity-0 scale-95"
        method="post"
      >
        <Menu.Items className="absolute right-0 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus-visible:outline-none">
          <MenuItem href="/user/profile">Your profile</MenuItem>
          <MenuItem href="/user/settings">Settings</MenuItem>
          <MenuItem as="button" className="w-full text-left">
            Sign out
          </MenuItem>
        </Menu.Items>
      </Transition>
    </Menu>
  )
}
