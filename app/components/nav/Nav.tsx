import { Disclosure } from "@headlessui/react"
import clsx from "clsx"
import { NavLink } from "remix"
import { AnalyzerLogo } from "~/components/common/AnalyzerLogo"
import { navItems } from "~/components/nav/config"
import { MobileMenuButton } from "~/components/nav/MobileMenuButton"
import { UserMenu } from "~/components/nav/UserMenu"

const navLinkStyle = (isActive: boolean) =>
  clsx(
    "rounded-md px-3 py-2 text-sm font-medium",
    isActive
      ? "bg-gray-900 text-white"
      : "text-gray-300 hover:bg-gray-700 hover:text-white"
  )

export function Nav() {
  return (
    <Disclosure as="nav" className="bg-gray-800">
      {({ open }) => (
        <>
          <div className="mx-auto flex h-16 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
            <div className="flex items-center">
              <AnalyzerLogo className="h-8 w-8 flex-shrink-0" />

              <div className="ml-10 hidden items-baseline space-x-4 md:flex">
                {navItems.map((item) => (
                  <NavLink
                    key={item.href}
                    className={({ isActive }) => navLinkStyle(isActive)}
                    to={item.href}
                  >
                    {item.name}
                  </NavLink>
                ))}
              </div>
            </div>

            <div className="flex items-center">
              <MobileMenuButton open={open} />
              <UserMenu />
            </div>
          </div>

          <Disclosure.Panel className="flex flex-col gap-1 p-3 md:hidden">
            {navItems.map((item) => (
              <Disclosure.Button<"a">
                key={item.href}
                as="a"
                className="block rounded-md px-3 py-2 text-base font-medium text-gray-400 hover:bg-gray-700 hover:text-white"
                href={item.href}
              >
                {item.name}
              </Disclosure.Button>
            ))}
          </Disclosure.Panel>
        </>
      )}
    </Disclosure>
  )
}
