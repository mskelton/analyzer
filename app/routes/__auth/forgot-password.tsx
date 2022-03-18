import { ActionFunction, MetaFunction, useActionData } from "remix"
import invariant from "tiny-invariant"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { Alert } from "~/components/common/Alert"
import { TextField } from "~/components/common/TextField"
import { addHours } from "~/utils/date"
import { sendForgotPasswordEmail } from "~/utils/mail.server"
import { seo } from "~/utils/seo"
import { hmac } from "~/utils/signing.server"

export const meta: MetaFunction = () => {
  return seo({
    description: `Forgot your password? No problem, we'll send you a link to reset it.`,
    title: "Forgot password",
  })
}

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()
  const email = formData.get("email")

  invariant(typeof email === "string")

  // Use the forgot password URL as the base for the reset password URL
  const url = new URL(`${new URL(request.url).origin}/reset-password`)

  // Add the email, expiration, and signature to the URL
  url.searchParams.set("email", email)
  url.searchParams.set("expires", addHours(new Date(), 1).getTime().toString())
  url.searchParams.set("signature", hmac(url.href))

  await sendForgotPasswordEmail(email, url)

  return { message: "Check your inbox for a link to reset your password." }
}

export default function ForgotPassword() {
  const data = useActionData<{ message: string }>()

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
        {data?.message && (
          <Alert className="mb-6" type="success">
            {data.message}
          </Alert>
        )}

        <form className="flex flex-col gap-6" method="POST">
          <TextField
            autoComplete="email"
            label="Email address"
            name="email"
            placeholder="Enter your email address"
            type="email"
          />

          <AuthButton>Send password reset email</AuthButton>
        </form>
      </AuthCard>
    </div>
  )
}
