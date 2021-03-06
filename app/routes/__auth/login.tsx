import { FaGithub, FaGoogle, FaTwitter } from "react-icons/fa"
import {
  ActionFunction,
  Link,
  LoaderFunction,
  MetaFunction,
  redirect,
} from "remix"
import invariant from "tiny-invariant"
import { login } from "~/api/auth.server"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { FormError } from "~/components/common/FormError"
import { TextField } from "~/components/common/TextField"
import { handleError } from "~/utils/errors.server"
import { seo } from "~/utils/seo"
import { commitUser, getUserArn } from "~/utils/session.server"

export const meta: MetaFunction = () => {
  return seo({
    description: "Login to your Analyzer account.",
    title: "Login",
  })
}

export const loader: LoaderFunction = async ({ request }) => {
  // Redirect to the home page if they are already signed in.
  return (await getUserArn(request, true)) ? redirect("/dashboard") : null
}

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()
  const email = formData.get("email")
  const password = formData.get("password")

  // Validate form data
  invariant(typeof email === "string")
  invariant(typeof password === "string")

  try {
    const user = await login(email, password)

    return commitUser(request, user.arn)
  } catch (err) {
    return handleError(err)
  }
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
        <FormError />

        <form className="flex flex-col gap-6" method="post">
          <TextField
            autoComplete="email"
            autoFocus
            label="Email address"
            name="email"
            type="email"
          />

          <TextField
            autoComplete="password"
            extra={
              <Link className="link text-sm font-medium" to="/forgot-password">
                Forgot password?
              </Link>
            }
            label="Password"
            name="password"
            type="password"
          />

          <AuthButton>Sign in</AuthButton>
        </form>

        <div className="mt-6">
          <div className="relative">
            <div className="absolute inset-0 flex items-center">
              <div className="w-full border-t border-gray-300" />
            </div>
            <div className="relative flex justify-center text-sm">
              <span className="bg-white px-2 text-gray-500">
                Or continue with
              </span>
            </div>
          </div>

          <div className="mt-6 grid grid-cols-3 gap-3">
            <div>
              <a
                className="inline-flex w-full justify-center rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-500 shadow-sm hover:bg-gray-50"
                href="#"
              >
                <span className="sr-only">Sign in with Facebook</span>
                <FaGoogle className="h-5 w-5" />
              </a>
            </div>

            <div>
              <a
                className="inline-flex w-full justify-center rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-500 shadow-sm hover:bg-gray-50"
                href="#"
              >
                <span className="sr-only">Sign in with Twitter</span>
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
      </AuthCard>
    </div>
  )
}
