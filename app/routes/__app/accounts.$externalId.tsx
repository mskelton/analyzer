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
  const formData = await request.formData()
  const method = formData.get("_method")
  const externalId = params.externalId!

  try {
    if (method === "delete") {
      await deleteAccount(request, externalId)
    } else {
      const data = await validateAccountData(formData)
      await updateAccount(request, externalId, data)
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
      <PageHeader
        extra={
          <form method="post">
            <button className="btn-danger" name="_method" value="delete">
              Delete account
            </button>
          </form>
        }
      >
        Editing &quot;{account.name}&quot;
      </PageHeader>
      <AccountForm />
    </>
  )
}
