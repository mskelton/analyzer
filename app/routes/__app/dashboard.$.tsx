import { HiDatabase } from "react-icons/hi"
import {
  Link,
  LoaderFunction,
  MetaFunction,
  redirect,
  useNavigate,
} from "remix"
import { getAccounts } from "~/api/accounts.server"
import { NoAccounts } from "~/components/accounts/NoAccounts"
import { EmptyState } from "~/components/common/EmptyState"
import { PageContent } from "~/components/common/PageContent"
import { PageHeader } from "~/components/common/PageHeader"
import { AccountSelect } from "~/components/dashboard/AccountSelect"
import { WidgetManager } from "~/components/dashboard/WidgetManager"
import { useDashboard } from "~/hooks/useDashboard"
import { getArnId } from "~/utils/arn"

export const meta: MetaFunction = () => {
  return { title: "Dashboard" }
}

export const loader: LoaderFunction = async ({ params, request }) => {
  const accounts = await getAccounts(request)
  const arnId = params["*"]

  // If there are no accounts, don't try to load the account
  if (!accounts.length) {
    return { accounts }
  }

  // If no arnId is provided, redirect to the first account
  if (!arnId) {
    return redirect(`/dashboard/${getArnId(accounts[0].arn)}`)
  }

  // Find the selected account by the arnId
  const account = accounts.find((account) => getArnId(account.arn) === arnId)

  // If the provided arnId doesn't exist, throw a 404
  if (!account) {
    throw new Response("Not Found", { status: 404 })
  }

  return { account, accounts }
}

export default function Dashboard() {
  const { account } = useDashboard()
  const navigate = useNavigate()

  return (
    <>
      <PageHeader
        extra={
          <AccountSelect
            onChange={(account) => navigate(getArnId(account.arn))}
            value={account}
          />
        }
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
