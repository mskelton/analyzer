import { Popover, Transition } from "@headlessui/react"
import { Fragment } from "react"
import { FaGithub, FaGoogle, FaTwitter } from "react-icons/fa"
import { HiMenu, HiX } from "react-icons/hi"
import { Link } from "remix"
import { Features } from "~/components/marketing/Features"
import { Footer } from "~/components/marketing/Footer"
import { HeroPattern } from "~/components/marketing/HeroPattern"

const navigation = [
  { href: "/product", name: "Product" },
  { href: "/features", name: "Features" },
  { href: "/about", name: "About" },
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

      <div className="relative pt-6">
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
                    <HiMenu aria-hidden="true" className="h-6 w-6" />
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
              <Link
                className="inline-flex items-center rounded-md border border-transparent bg-gray-600 px-4 py-2 text-sm font-medium text-white hover:bg-gray-700"
                to="/login"
              >
                Log in
              </Link>
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
                      <HiX aria-hidden="true" className="h-6 w-6" />
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
          <div className="mx-auto mb-16 max-w-7xl">
            <div className="lg:grid lg:grid-cols-12 lg:gap-8">
              <div className="px-4 sm:px-6 sm:text-center md:mx-auto md:max-w-2xl lg:col-span-6 lg:flex lg:items-center lg:text-left">
                <div>
                  <h1 className="mt-4 text-4xl font-extrabold tracking-tight text-white sm:mt-5 sm:leading-none lg:mt-6 lg:text-5xl xl:text-6xl">
                    <span className="md:block">Gain insights in your</span>{" "}
                    <span className="text-indigo-400 md:block">
                      Forex trading
                    </span>
                  </h1>
                  <p className="mt-3 text-base text-gray-300 sm:mt-5 sm:text-xl lg:text-lg xl:text-xl">
                    Level up your Forex trading with our trading analysis tools.
                    Aimed for simplicity and customization, you will find
                    everything you need to monitor your accounts, track
                    performance, and share your results with others.
                  </p>

                  <div className="mt-5 sm:mt-8 sm:flex sm:justify-center lg:justify-start">
                    <div className="rounded-md shadow">
                      <Link
                        className="flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-700 md:py-4 md:px-10 md:text-lg"
                        to="/signup"
                      >
                        Get started
                      </Link>
                    </div>
                    <div className="mt-3 sm:mt-0 sm:ml-3">
                      <a
                        className="btn-white flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-100 px-8 py-3 text-base font-medium text-indigo-700 hover:bg-indigo-200 md:py-4 md:px-10 md:text-lg"
                        href="#"
                      >
                        Read the docs
                      </a>
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
                            <FaGoogle className="h-5 w-5" />
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
                            <FaTwitter className="h-5 w-5" />
                          </a>
                        </div>

                        <div>
                          <a
                            className="inline-flex w-full justify-center rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-500 shadow-sm hover:bg-gray-50"
                            href="#"
                          >
                            <span className="sr-only">Sign in with GitHub</span>
                            <FaGithub className="h-5 w-5" />
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
                      <form
                        action="/signup"
                        className="space-y-6"
                        method="post"
                      >
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
                          <label className="sr-only" htmlFor="email">
                            Email
                          </label>
                          <input
                            autoComplete="email"
                            className="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                            id="email"
                            name="email"
                            placeholder="Email"
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

          <Features />
        </main>

        <Footer />
      </div>
    </div>
  )
}
