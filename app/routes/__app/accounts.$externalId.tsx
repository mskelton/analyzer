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
  deleteAccount,
  getAccount,
  getAccountArn,
  updateAccount,
  validateAccountData,
} from "~/api/accounts.server"
import { AccountForm } from "~/components/accounts/AccountForm"
import { DeleteAccount } from "~/components/accounts/DeleteAccount"
import { PageHeader } from "~/components/common/PageHeader"

export const meta: MetaFunction = ({ data }) => {
  return { title: data.account.name }
}

export const loader: LoaderFunction = async ({ params, request }) => {
  return { account: await getAccount(request, params.externalId!) }
}

export const action: ActionFunction = async ({ params, request }) => {
  const formData = await request.formData()
  const method = formData.get("_method")
  const arn = await getAccountArn(request, params.externalId!)

  try {
    if (method === "delete") {
      await deleteAccount(arn)
    } else {
      const data = await validateAccountData(formData)
      await updateAccount(arn, data)
    }

    return redirect("/accounts")
  } catch (err) {
    return json({ error: (err as Error).message }, { status: 400 })
  }
}

export default function EditAccount() {
  const { account } = useLoaderData<{ account: Account }>()

  return (
    <>
      <PageHeader extra={<DeleteAccount />}>
        Editing &quot;{account.name}&quot;
      </PageHeader>
      <AccountForm />
    </>
  )
}
