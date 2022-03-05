import { Link, LoaderFunction, MetaFunction } from "remix"
import { getAccounts } from "~/api/accounts.server"
import { AccountsTable } from "~/components/accounts/AccountsTable"
import { NoAccounts } from "~/components/accounts/NoAccounts"
import { PageContent } from "~/components/common/PageContent"
import { PageHeader } from "~/components/common/PageHeader"
import { useAccounts } from "~/hooks/useAccounts"

export const meta: MetaFunction = () => {
  return { title: "Accounts" }
}

export const loader: LoaderFunction = async ({ request }) => {
  const accounts = await getAccounts(request)

  return { accounts }
}

export default function Accounts() {
  const { accounts } = useAccounts()

  return (
    <>
      <PageHeader
        extra={
          <Link className="btn-primary btn-small" to="new">
            Add account
          </Link>
        }
      >
        Accounts
      </PageHeader>

      <PageContent>
        {accounts.length ? <AccountsTable /> : <NoAccounts />}
      </PageContent>
    </>
  )
}
