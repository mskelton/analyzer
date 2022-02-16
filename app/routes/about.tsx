import { Link, MetaFunction } from "remix"
import { seo } from "../utils/seo"

export const meta: MetaFunction = () => {
  return seo({
    description: `Learn more about the Analyzer project and it's awesome features!`,
    title: "About - Analyzer",
  })
}

export default function About() {
  return (
    <div data-testid="about">
      <div className="mx-auto max-w-3xl px-4 sm:px-6 xl:max-w-5xl xl:px-0">
        <div className="flex h-screen flex-col justify-between">
          <header className="flex items-center justify-between py-10">
            <div>
              <Link aria-label="Analyzer" to="/">
                <div className="flex items-center justify-between">
                  <div className="mr-3">
                    <img
                      alt="Mark Skelton"
                      className="h-10 w-10 rounded-full"
                      src="/images/me.jpg"
                    />
                  </div>

                  <p className="hidden text-2xl font-semibold sm:block">
                    Analyzer
                  </p>
                </div>
              </Link>
            </div>

            <div className="flex items-center text-base leading-5">
              <div className="hidden sm:block">
                {navLinks.map((link) => (
                  <Link
                    key={link.title}
                    className="link-secondary p-1 font-medium sm:p-4"
                    href={link.href}
                  >
                    {link.title}
                  </Link>
                ))}
              </div>

              <ThemeSwitch />
              <MobileNav />
            </div>
          </header>

          <main className="mb-auto">{children}</main>
          <Footer />
        </div>
      </div>
    </div>
  )
}
