import { FaGithub, FaTwitter } from "react-icons/fa"
import { HiMailOpen } from "react-icons/hi"

const navigation = {
  social: [
    {
      href: "https://github.com/mskelton/analyzer",
      icon: FaGithub,
      name: "GitHub",
    },
    {
      href: "https://twitter.com/mskelton0",
      icon: FaTwitter,
      name: "Twitter",
    },
    {
      href: "mailto:mdskelton99@gmail.com",
      icon: HiMailOpen,
      name: "Email",
    },
  ],
}

export function Footer() {
  return (
    <footer aria-labelledby="footer-heading">
      <h2 className="sr-only" id="footer-heading">
        Footer
      </h2>

      <div className="mx-auto max-w-7xl py-12 px-4 sm:px-6 lg:px-8">
        <div className="md:flex md:items-center md:justify-between">
          <div className="flex space-x-6 md:order-2">
            {navigation.social.map((item) => (
              <a
                key={item.name}
                className="text-gray-400 hover:text-gray-300"
                href={item.href}
              >
                <span className="sr-only">{item.name}</span>
                <item.icon aria-hidden="true" className="h-6 w-6" />
              </a>
            ))}
          </div>

          <p className="mt-8 text-base text-gray-400 md:order-1 md:mt-0">
            &copy; {new Date().getFullYear()} Mark Skelton. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  )
}
