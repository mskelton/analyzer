import { Account } from "@prisma/client"
import { Params } from "react-router-dom"
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
  updateAccount,
  validateAccountData,
} from "~/api/accounts.server"
import { AccountForm } from "~/components/accounts/AccountForm"
import { DeleteAccount } from "~/components/accounts/DeleteAccount"
import { PageHeader } from "~/components/common/PageHeader"
import { createArn } from "~/utils/arn"
import { getUserId } from "~/utils/session.server"

async function getAccountArn(request: Request, params: Params) {
  const userId = await getUserId(request)
  return createArn("account", userId, params.externalId!)
}

export const meta: MetaFunction = ({ data }) => {
  return { title: data.account.name }
}

export const loader: LoaderFunction = async ({ params, request }) => {
  const arn = await getAccountArn(request, params)

  return { account: await getAccount(arn) }
}

export const action: ActionFunction = async ({ params, request }) => {
  const formData = await request.formData()
  const method = formData.get("_method")
  const arn = await getAccountArn(request, params)

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
