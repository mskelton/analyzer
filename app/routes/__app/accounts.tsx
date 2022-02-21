import { Link, LoaderFunction, MetaFunction } from "remix"
import { getAccounts } from "~/api/accounts.server"
import { AccountsTable } from "~/components/accounts/AccountsTable"
import { EmptyState } from "~/components/common/EmptyState"
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
          <Link className="btn-primary" to="new">
            Add account
          </Link>
        }
      >
        Accounts
      </PageHeader>

      <main>
        <div className="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
          <div className="px-4 py-6 sm:px-0">
            {accounts.length ? (
              <AccountsTable />
            ) : (
              <EmptyState
                description="Add your first account to get started with Analyzer."
                title="No accounts"
              />
            )}
          </div>
        </div>
      </main>
    </>
  )
}
