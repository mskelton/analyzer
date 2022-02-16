import { ActionFunction, Form, MetaFunction, redirect } from "remix"
import { signUp } from "~/api/auth"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { TextField } from "~/components/common/TextField"
import { seo } from "~/utils/seo"

export const meta: MetaFunction = () => {
  return seo({
    description: `Create your Analyzer account to start monitoring your Forex performance.`,
    title: "Sign Up - Analyzer",
  })
}

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()

  const name = formData.get("name") as string
  const email = formData.get("email") as string
  const password = formData.get("password") as string

  // TODO: Validate form data
  await signUp(name, email, password)

  return redirect("/dashboard")
}

export default function SignUp() {
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
        <Form className="flex flex-col gap-6" method="post">
          <TextField
            autoComplete="name"
            label="Full name"
            name="name"
            type="text"
          />

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

          <AuthButton className="mt-4">Sign in</AuthButton>
        </Form>
      </AuthCard>
    </div>
  )
}
