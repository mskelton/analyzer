import { Account } from "@prisma/client"
import {
  ActionFunction,
  json,
  LoaderFunction,
  MetaFunction,
  redirect,
  useLoaderData,
} from "remix"
import {
  getAccount,
  updateAccount,
  validateAccountData,
} from "~/api/accounts.server"
import { AccountForm } from "~/components/accounts/AccountForm"
import { PageHeader } from "~/components/common/PageHeader"

export const meta: MetaFunction = ({ data }) => {
  return { title: data.account.name }
}

export const loader: LoaderFunction = async ({ params }) => {
  return {
    account: await getAccount(params.externalId!),
  }
}

export const action: ActionFunction = async ({ params, request }) => {
  const data = await validateAccountData(request)

  try {
    await updateAccount(params.externalId!, data)

    return redirect("/accounts")
  } catch (err) {
    return json({ error: (err as Error).message }, { status: 400 })
  }
}

export default function EditAccount() {
  const { account } = useLoaderData<{ account: Account }>()

  return (
    <>
      <PageHeader>Editing &quot;{account.name}&quot;</PageHeader>
      <AccountForm />
    </>
  )
}
