import { ActionFunction, json, MetaFunction, useActionData } from "remix"
import invariant from "tiny-invariant"
import { signUp } from "~/api/auth.server"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { Alert } from "~/components/common/Alert"
import { TextField } from "~/components/common/TextField"
import { seo } from "~/utils/seo"
import { commitUser } from "~/utils/session.server"

export const meta: MetaFunction = () => {
  return seo({
    description: `Create your Analyzer account to start monitoring your Forex performance.`,
    title: "Sign Up",
  })
}

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()
  const name = formData.get("name")
  const email = formData.get("email")
  const password = formData.get("password")

  // Validate form data
  invariant(typeof name === "string")
  invariant(typeof email === "string")
  invariant(typeof password === "string")

  try {
    const user = await signUp(name, email, password)

    return commitUser(request, user.id)
  } catch (err) {
    return json({ error: (err as Error).message }, { status: 400 })
  }
}

export default function SignUp() {
  const data = useActionData<{ error: string }>()

  return (
    <div data-testid="sign-up">
      <AuthHeader
        hint="Already have an account?"
        hintLink="/login"
        hintLinkText="Login"
      >
        Create your account
      </AuthHeader>

      <AuthCard>
        {data?.error && (
          <Alert className="mb-6" type="danger">
            {data.error}
          </Alert>
        )}

        <form className="flex flex-col gap-6" method="post">
          <TextField
            autoComplete="name"
            label="Full name"
            name="name"
            required
            type="text"
          />

          <TextField
            autoComplete="email"
            label="Email address"
            name="email"
            required
            type="email"
          />

          <TextField
            autoComplete="current-password"
            label="Password"
            name="password"
            required
            type="password"
          />

          <AuthButton className="mt-4">Sign in</AuthButton>
        </form>
      </AuthCard>
    </div>
  )
}
