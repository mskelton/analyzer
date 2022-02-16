import { ActionFunction, Link, MetaFunction, redirect } from "remix"
import { login } from "~/api/auth"
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

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()

  const email = formData.get("email") as string
  const password = formData.get("password") as string

  // TODO: Validate form data
  await login(email, password)

  return redirect("/dashboard")
}

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
                className="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500"
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
              className="text-sm font-medium text-primary-600 hover:text-primary-500"
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
