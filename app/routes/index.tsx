import { Popover, Transition } from "@headlessui/react"
import { MenuIcon, XIcon } from "@heroicons/react/outline"
import { ChevronRightIcon } from "@heroicons/react/solid"
import { Fragment } from "react"
import { HeroPattern } from "~/components/marketing/HeroPattern"

const navigation = [
  { href: "/product", name: "Product" },
  { href: "/features", name: "Features" },
  { href: "/marketplace", name: "Marketplace" },
  { href: "/company", name: "Company" },
]

export default function Home() {
  return (
    <div className="relative overflow-hidden bg-gray-800">
      <div
        aria-hidden="true"
        className="hidden sm:absolute sm:inset-0 sm:block"
      >
        <HeroPattern />
      </div>

      <div className="relative pt-6 pb-16 sm:pb-24">
        <Popover>
          <nav
            aria-label="Global"
            className="relative mx-auto flex max-w-7xl items-center justify-between px-4 sm:px-6"
          >
            <div className="flex flex-1 items-center">
              <div className="flex w-full items-center justify-between md:w-auto">
                <a href="#">
                  <span className="sr-only">Workflow</span>
                  <img
                    alt=""
                    className="h-8 w-auto sm:h-10"
                    src="https://tailwindui.com/img/logos/workflow-mark-indigo-500.svg"
                  />
                </a>
                <div className="-mr-2 flex items-center md:hidden">
                  <Popover.Button className="focus-ring-inset inline-flex items-center justify-center rounded-md bg-gray-800 p-2 text-gray-400 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-white">
                    <span className="sr-only">Open main menu</span>
                    <MenuIcon aria-hidden="true" className="h-6 w-6" />
                  </Popover.Button>
                </div>
              </div>
              <div className="hidden space-x-10 md:ml-10 md:flex">
                {navigation.map((item) => (
                  <a
                    key={item.name}
                    className="font-medium text-white hover:text-gray-300"
                    href={item.href}
                  >
                    {item.name}
                  </a>
                ))}
              </div>
            </div>
            <div className="hidden md:flex">
              <a
                className="inline-flex items-center rounded-md border border-transparent bg-gray-600 px-4 py-2 text-sm font-medium text-white hover:bg-gray-700"
                href="#"
              >
                Log in
              </a>
            </div>
          </nav>

          <Transition
            as={Fragment}
            enter="duration-150 ease-out"
            enterFrom="opacity-0 scale-95"
            enterTo="opacity-100 scale-100"
            leave="duration-100 ease-in"
            leaveFrom="opacity-100 scale-100"
            leaveTo="opacity-0 scale-95"
          >
            <Popover.Panel
              className="absolute inset-x-0 top-0 z-10 origin-top-right transform p-2 transition md:hidden"
              focus
            >
              <div className="overflow-hidden rounded-lg bg-white shadow-md ring-1 ring-black ring-opacity-5">
                <div className="flex items-center justify-between px-5 pt-4">
                  <div>
                    <img
                      alt=""
                      className="h-8 w-auto"
                      src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
                    />
                  </div>
                  <div className="-mr-2">
                    <Popover.Button className="inline-flex items-center justify-center rounded-md bg-white p-2 text-gray-400 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500">
                      <span className="sr-only">Close menu</span>
                      <XIcon aria-hidden="true" className="h-6 w-6" />
                    </Popover.Button>
                  </div>
                </div>
                <div className="space-y-1 px-2 pt-2 pb-3">
                  {navigation.map((item) => (
                    <a
                      key={item.name}
                      className="block rounded-md px-3 py-2 text-base font-medium text-gray-700 hover:bg-gray-50 hover:text-gray-900"
                      href={item.href}
                    >
                      {item.name}
                    </a>
                  ))}
                </div>
                <a
                  className="block w-full bg-gray-50 px-5 py-3 text-center font-medium text-indigo-600 hover:bg-gray-100"
                  href="#"
                >
                  Log in
                </a>
              </div>
            </Popover.Panel>
          </Transition>
        </Popover>

        <main className="mt-16 sm:mt-24">
          <div className="mx-auto max-w-7xl">
            <div className="lg:grid lg:grid-cols-12 lg:gap-8">
              <div className="px-4 sm:px-6 sm:text-center md:mx-auto md:max-w-2xl lg:col-span-6 lg:flex lg:items-center lg:text-left">
                <div>
                  <a
                    className="inline-flex items-center rounded-full bg-gray-900 p-1 pr-2 text-white hover:text-gray-200 sm:text-base lg:text-sm xl:text-base"
                    href="#"
                  >
                    <span className="rounded-full bg-indigo-500 px-3 py-0.5 text-xs font-semibold uppercase leading-5 tracking-wide text-white">
                      We&rsquo;re hiring
                    </span>
                    <span className="ml-4 text-sm">Visit our careers page</span>
                    <ChevronRightIcon
                      aria-hidden="true"
                      className="ml-2 h-5 w-5 text-gray-500"
                    />
                  </a>
                  <h1 className="mt-4 text-4xl font-extrabold tracking-tight text-white sm:mt-5 sm:leading-none lg:mt-6 lg:text-5xl xl:text-6xl">
                    <span className="md:block">Data to enrich your</span>{" "}
                    <span className="text-indigo-400 md:block">
                      online business
                    </span>
                  </h1>
                  <p className="mt-3 text-base text-gray-300 sm:mt-5 sm:text-xl lg:text-lg xl:text-xl">
                    Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure
                    qui lorem cupidatat commodo. Elit sunt amet fugiat veniam
                    occaecat fugiat aliqua ad ad non deserunt sunt.
                  </p>
                  <p className="mt-8 text-sm font-semibold uppercase tracking-wide text-white sm:mt-10">
                    Used by
                  </p>
                  <div className="mt-5 w-full sm:mx-auto sm:max-w-lg lg:ml-0">
                    <div className="flex flex-wrap items-start justify-between">
                      <div className="flex justify-center px-1">
                        <img
                          alt="Tuple"
                          className="h-9 sm:h-10"
                          src="https://tailwindui.com/img/logos/tuple-logo-gray-400.svg"
                        />
                      </div>
                      <div className="flex justify-center px-1">
                        <img
                          alt="Workcation"
                          className="h-9 sm:h-10"
                          src="https://tailwindui.com/img/logos/workcation-logo-gray-400.svg"
                        />
                      </div>
                      <div className="flex justify-center px-1">
                        <img
                          alt="StaticKit"
                          className="h-9 sm:h-10"
                          src="https://tailwindui.com/img/logos/statickit-logo-gray-400.svg"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="mt-16 sm:mt-24 lg:col-span-6 lg:mt-0">
                <div className="bg-white sm:mx-auto sm:w-full sm:max-w-md sm:overflow-hidden sm:rounded-lg">
                  <div className="px-4 py-8 sm:px-10">
                    <div>
                      <p className="text-sm font-medium text-gray-700">
                        Sign in with
                      </p>

                      <div className="mt-2 grid grid-cols-3 gap-3">
                        <div>
                          <a
                            className="inline-flex w-full justify-center rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-500 shadow-sm hover:bg-gray-50"
                            href="#"
                          >
                            <span className="sr-only">
                              Sign in with Facebook
                            </span>
                            <svg
                              aria-hidden="true"
                              className="h-5 w-5"
                              fill="currentColor"
                              viewBox="0 0 20 20"
                            >
                              <path
                                clipRule="evenodd"
                                d="M20 10c0-5.523-4.477-10-10-10S0 4.477 0 10c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V10h2.54V7.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V10h2.773l-.443 2.89h-2.33v6.988C16.343 19.128 20 14.991 20 10z"
                                fillRule="evenodd"
                              />
                            </svg>
                          </a>
                        </div>

                        <div>
                          <a
                            className="inline-flex w-full justify-center rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-500 shadow-sm hover:bg-gray-50"
                            href="#"
                          >
                            <span className="sr-only">
                              Sign in with Twitter
                            </span>
                            <svg
                              aria-hidden="true"
                              className="h-5 w-5"
                              fill="currentColor"
                              viewBox="0 0 20 20"
                            >
                              <path d="M6.29 18.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0020 3.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.073 4.073 0 01.8 7.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 010 16.407a11.616 11.616 0 006.29 1.84" />
                            </svg>
                          </a>
                        </div>

                        <div>
                          <a
                            className="inline-flex w-full justify-center rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-500 shadow-sm hover:bg-gray-50"
                            href="#"
                          >
                            <span className="sr-only">Sign in with GitHub</span>
                            <svg
                              aria-hidden="true"
                              className="h-5 w-5"
                              fill="currentColor"
                              viewBox="0 0 20 20"
                            >
                              <path
                                clipRule="evenodd"
                                d="M10 0C4.477 0 0 4.484 0 10.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0110 4.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.942.359.31.678.921.678 1.856 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0020 10.017C20 4.484 15.522 0 10 0z"
                                fillRule="evenodd"
                              />
                            </svg>
                          </a>
                        </div>
                      </div>
                    </div>

                    <div className="relative mt-6">
                      <div
                        aria-hidden="true"
                        className="absolute inset-0 flex items-center"
                      >
                        <div className="w-full border-t border-gray-300" />
                      </div>
                      <div className="relative flex justify-center text-sm">
                        <span className="bg-white px-2 text-gray-500">Or</span>
                      </div>
                    </div>

                    <div className="mt-6">
                      <form action="#" className="space-y-6" method="POST">
                        <div>
                          <label className="sr-only" htmlFor="name">
                            Full name
                          </label>
                          <input
                            autoComplete="name"
                            className="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                            id="name"
                            name="name"
                            placeholder="Full name"
                            required
                            type="text"
                          />
                        </div>

                        <div>
                          <label className="sr-only" htmlFor="mobile-or-email">
                            Mobile number or email
                          </label>
                          <input
                            autoComplete="email"
                            className="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                            id="mobile-or-email"
                            name="mobile-or-email"
                            placeholder="Mobile number or email"
                            required
                            type="text"
                          />
                        </div>

                        <div>
                          <label className="sr-only" htmlFor="password">
                            Password
                          </label>
                          <input
                            autoComplete="current-password"
                            className="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                            id="password"
                            name="password"
                            placeholder="Password"
                            required
                            type="password"
                          />
                        </div>

                        <div>
                          <button
                            className="flex w-full justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                            type="submit"
                          >
                            Create your account
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                  <div className="border-t-2 border-gray-200 bg-gray-50 px-4 py-6 sm:px-10">
                    <p className="text-xs leading-5 text-gray-500">
                      By signing up, you agree to our{" "}
                      <a
                        className="font-medium text-gray-900 hover:underline"
                        href="#"
                      >
                        Terms
                      </a>
                      ,{" "}
                      <a
                        className="font-medium text-gray-900 hover:underline"
                        href="#"
                      >
                        Data Policy
                      </a>{" "}
                      and{" "}
                      <a
                        className="font-medium text-gray-900 hover:underline"
                        href="#"
                      >
                        Cookies Policy
                      </a>
                      .
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
  )
}
