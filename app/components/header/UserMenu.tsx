import { Menu, Transition } from "@headlessui/react"
import clsx from "clsx"
import { Fragment } from "react"

const user = {
  email: "tom@example.com",
  imageUrl: `https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80`,
  name: "Tom Cook",
}

const userNavigation = [
  { href: "#", name: "Your Profile" },
  { href: "#", name: "Settings" },
]

const itemStyles = (active: boolean) =>
  clsx("block px-4 py-2 text-sm text-gray-700", active && "bg-gray-100")

export function UserMenu() {
  return (
    <Menu as="div" className="relative ml-3">
      <div>
        <Menu.Button className="flex max-w-xs items-center rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
          <span className="sr-only">Open user menu</span>
          <img alt="" className="h-8 w-8 rounded-full" src={user.imageUrl} />
        </Menu.Button>
      </div>

      <Transition
        as={Fragment}
        enter="transition ease-out duration-100"
        enterFrom="transform opacity-0 scale-95"
        enterTo="transform opacity-100 scale-100"
        leave="transition ease-in duration-75"
        leaveFrom="transform opacity-100 scale-100"
        leaveTo="transform opacity-0 scale-95"
      >
        <Menu.Items className="absolute right-0 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
          {userNavigation.map((item) => (
            <Menu.Item key={item.name}>
              {({ active }: { active: boolean }) => (
                <a className={itemStyles(active)} href={item.href}>
                  {item.name}
                </a>
              )}
            </Menu.Item>
          ))}

          <Menu.Item>
            {({ active }: { active: boolean }) => (
              <form action="/logout" method="post">
                <button
                  className={`${itemStyles(active)} block w-full text-left`}
                >
                  Sign out
                </button>
              </form>
            )}
          </Menu.Item>
        </Menu.Items>
      </Transition>
    </Menu>
  )
}
