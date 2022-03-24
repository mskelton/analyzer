import { useState } from "react"
import { HiDatabase } from "react-icons/hi"
import { Link, LoaderFunction, MetaFunction } from "remix"
import { getAccounts } from "~/api/accounts.server"
import { NoAccounts } from "~/components/accounts/NoAccounts"
import { EmptyState } from "~/components/common/EmptyState"
import { PageContent } from "~/components/common/PageContent"
import { PageHeader } from "~/components/common/PageHeader"
import { AccountSelect } from "~/components/dashboard/AccountSelect"
import { WidgetManager } from "~/components/dashboard/WidgetManager"
import { useDashboard } from "~/hooks/useDashboard"

export const meta: MetaFunction = () => {
  return { title: "Dashboard" }
}

export const loader: LoaderFunction = async ({ request }) => {
  return { accounts: await getAccounts(request) }
}

export default function Dashboard() {
  const { accounts } = useDashboard()
  const [account, setAccount] = useState(accounts[0])
  console.log(account)

  return (
    <>
      <PageHeader
        extra={<AccountSelect onChange={setAccount} value={account} />}
      >
        Dashboard
      </PageHeader>

      <PageContent>
        {!account ? (
          <NoAccounts>
            <Link className="btn-primary mt-6" to="/accounts/new">
              Add account
            </Link>
          </NoAccounts>
        ) : !account.metrics ? (
          <EmptyState
            description="This account has no metrics yet. Connect the EA to your account to upload your account history."
            icon={<HiDatabase />}
            title="No metrics found"
          />
        ) : (
          <WidgetManager metrics={account.metrics} />
        )}
      </PageContent>
    </>
  )
}
