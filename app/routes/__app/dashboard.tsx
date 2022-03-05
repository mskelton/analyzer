import "~/components/charts/register"
import { Account } from "@prisma/client"
import { HiDatabase } from "react-icons/hi"
import { Link, LoaderFunction, MetaFunction, useLoaderData } from "remix"
import { getAccounts } from "~/api/accounts.server"
import { NoAccounts } from "~/components/accounts/NoAccounts"
import { BalanceChart } from "~/components/charts/BalanceChart"
import { ProfitChart } from "~/components/charts/ProfitChart"
import { EmptyState } from "~/components/common/EmptyState"
import { PageHeader } from "~/components/common/PageHeader"
import { Widget } from "~/components/dashboard/Widget"

export const meta: MetaFunction = () => {
  return { title: "Dashboard" }
}

export const loader: LoaderFunction = async ({ request }) => {
  return { accounts: await getAccounts(request) }
}

export default function Dashboard() {
  const { accounts } = useLoaderData<{ accounts: Account[] }>()

  return (
    <>
      <PageHeader>Dashboard</PageHeader>

      <main className="py-6 px-4 sm:px-6 lg:px-8">
        {accounts.length ? (
          accounts[0].metrics.length ? (
            <>
              <Widget title="Profit">
                <ProfitChart
                  metric={accounts[0].metrics.find((m) => m.key === "PROFIT")!}
                />
              </Widget>

              <Widget title="Account balance">
                <BalanceChart
                  metric={accounts[0].metrics.find((m) => m.key === "BALANCE")!}
                />
              </Widget>
            </>
          ) : (
            <EmptyState
              description="Your account has no metrics yet. Connect the EA to your account to upload your account history."
              icon={<HiDatabase />}
              title="No metrics found"
            />
          )
        ) : (
          <NoAccounts>
            <Link className="btn-primary mt-6" to="/accounts/new">
              Add account
            </Link>
          </NoAccounts>
        )}
      </main>
    </>
  )
}
