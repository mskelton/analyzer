import { ActionFunction, LoaderFunction, MetaFunction, redirect } from "remix"
import invariant from "tiny-invariant"
import { hashPassword } from "~/api/auth.server"
import { AuthButton } from "~/components/auth/AuthButton"
import { AuthCard } from "~/components/auth/AuthCard"
import { AuthHeader } from "~/components/auth/AuthHeader"
import { FormError } from "~/components/common/FormError"
import { TextField } from "~/components/common/TextField"
import { db } from "~/db.server"
import { seo } from "~/utils/seo"
import { validateURL } from "~/utils/signing.server"

export const meta: MetaFunction = () => {
  return seo({
    description: `Change your password to regain access to your Analyzer account.`,
    title: "Change password",
  })
}

export const loader: LoaderFunction = async ({ request }) => {
  return validateURL(new URL(request.url))
}

export const action: ActionFunction = async ({ request }) => {
  const url = new URL(request.url)

  // While the loader will catch validation errors, we still need to validate
  // on POST requests since a malicious user could manually trigger a post
  // request.
  validateURL(url)

  // Get the email and password from the URL and form data respectively
  const formData = await request.formData()
  const email = url.searchParams.get("email")
  const password = formData.get("password")

  // Validate URL and form data
  invariant(typeof email === "string")
  invariant(typeof password === "string")

  // Change the user's password
  await db.user.update({
    data: { password: await hashPassword(password) },
    where: { email },
  })

  // Redirect to the login page so the user can login with their new password
  return redirect("/login")
}

export default function ResetPassword() {
  return (
    <div data-testid="reset-password">
      <AuthHeader
        hint="Remember your password?"
        hintLink="/login"
        hintLinkText="Login"
      >
        Change password
      </AuthHeader>

      <AuthCard>
        <FormError />

        <form className="flex flex-col gap-6" method="POST">
          <TextField
            autoComplete="newPassword"
            label="Password"
            name="password"
            placeholder="Enter your new password"
            type="password"
          />

          <AuthButton>Change password</AuthButton>
        </form>
      </AuthCard>
    </div>
  )
}
