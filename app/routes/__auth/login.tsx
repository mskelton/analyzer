import {
  ActionFunction,
  json,
  Link,
  LoaderFunction,
  MetaFunction,
  redirect,
  useActionData,
} from "remix"
import invariant from "tiny-invariant"
import { login } from "~/api/auth.server"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { Alert } from "~/components/common/Alert"
import { TextField } from "~/components/common/TextField"
import { seo } from "~/utils/seo"
import { commitUser, getUserId } from "~/utils/session.server"

export const meta: MetaFunction = () => {
  return seo({
    description: "Login to your Analyzer account.",
    title: "Login",
  })
}

export const loader: LoaderFunction = async ({ request }) => {
  // Redirect to the home page if they are already signed in.
  return (await getUserId(request)) ? redirect("/dashboard") : null
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

    return commitUser(request, user.id)
  } catch (err) {
    return json({ error: (err as Error).message }, { status: 400 })
  }
}

export default function Login() {
  const data = useActionData<{ error: string }>()

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
        {data?.error && (
          <Alert className="mb-6" type="danger">
            {data.error}
          </Alert>
        )}

        <form className="flex flex-col gap-6" method="post">
          <TextField
            autoComplete="email"
            label="Email address"
            name="email"
            type="email"
          />

          <TextField
            autoComplete="password"
            extra={
              <Link
                className="text-sm font-medium text-primary-600 hover:text-primary-500"
                to="/forgot-password"
              >
                Forgot password?
              </Link>
            }
            label="Password"
            name="password"
            type="password"
          />

          <AuthButton>Sign in</AuthButton>
        </form>
      </AuthCard>
    </div>
  )
}
