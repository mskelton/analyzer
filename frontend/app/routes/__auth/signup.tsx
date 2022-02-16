import { MetaFunction } from "remix"
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
        <form action="#" className="flex flex-col gap-6" method="POST">
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
        </form>
      </AuthCard>
    </div>
  )
}
