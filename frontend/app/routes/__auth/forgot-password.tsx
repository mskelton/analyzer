import { MetaFunction } from "remix"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { TextField } from "~/components/common/TextField"
import { seo } from "~/utils/seo"

export const meta: MetaFunction = () => {
  return seo({
    description: `Forgot your password? No problem, we'll send you a link to reset it.`,
    title: "Forgot password - Analyzer",
  })
}

export default function ForgotPassword() {
  return (
    <div data-testid="forgot-password">
      <AuthHeader
        hint="Remember your password?"
        hintLink="/login"
        hintLinkText="Login"
      >
        Reset your password
      </AuthHeader>

      <AuthCard>
        <form action="#" className="flex flex-col gap-6" method="POST">
          <TextField
            autoComplete="email"
            label="Email address"
            name="email"
            type="email"
          />

          <AuthButton>Send me a link</AuthButton>
        </form>
      </AuthCard>
    </div>
  )
}
