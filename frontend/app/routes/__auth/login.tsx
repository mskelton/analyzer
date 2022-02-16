import { ActionFunction, Link, MetaFunction } from "remix"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { TextField } from "~/components/common/TextField"
import { seo } from "~/utils/seo"

export const meta: MetaFunction = () => {
  return seo({
    description: "Login to your Analyzer account.",
    title: "Login - Analyzer",
  })
}

export const action: ActionFunction = () => {}

export default function Login() {
  return (
    <div data-testid="sign-up">
      <AuthHeader
        hint="Don&rsquo;t have an account?"
        hintLink="/signup"
        hintLinkText="Sign up"
      >
        Sign in to your account
      </AuthHeader>

      <AuthCard>
        <form action="#" className="flex flex-col gap-6" method="POST">
          <TextField
            autoComplete="email"
            label="Email address"
            name="email"
            type="email"
          />

          <TextField
            autoComplete="password"
            label="Password"
            name="password"
            type="password"
          />

          <div className="flex items-center justify-between">
            <div className="flex items-center">
              <input
                className="text-primary-600 focus:ring-primary-500 h-4 w-4 rounded border-gray-300"
                id="remember-me"
                name="remember-me"
                type="checkbox"
              />

              <label
                className="ml-2 block text-sm text-gray-900"
                htmlFor="remember-me"
              >
                Remember me
              </label>
            </div>

            <Link
              className="text-primary-600 hover:text-primary-500 text-sm font-medium"
              to="/forgot-password"
            >
              Forgot your password?
            </Link>
          </div>

          <AuthButton>Sign in</AuthButton>
        </form>
      </AuthCard>
    </div>
  )
}
