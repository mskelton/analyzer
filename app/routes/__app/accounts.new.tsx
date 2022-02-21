import { ActionFunction, json, MetaFunction, redirect } from "remix"
import { createAccount, validateAccountData } from "~/api/accounts.server"
import { AccountForm } from "~/components/accounts/AccountForm"
import { PageHeader } from "~/components/common/PageHeader"

export const meta: MetaFunction = () => {
  return { title: "Create account" }
}

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()
  const data = await validateAccountData(formData)

  try {
    await createAccount(request, data)

    return redirect("/accounts")
  } catch (err) {
    return json({ error: (err as Error).message }, { status: 400 })
  }
}

export default function NewAccount() {
  return (
    <>
      <PageHeader>Create Account</PageHeader>
      <AccountForm />
    </>
  )
}
