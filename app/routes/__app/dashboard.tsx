import { Account } from "@prisma/client"
import { HiDatabase } from "react-icons/hi"
import { Link, LoaderFunction, MetaFunction, useLoaderData } from "remix"
import { getAccounts } from "~/api/accounts.server"
import { NoAccounts } from "~/components/accounts/NoAccounts"
import { EmptyState } from "~/components/common/EmptyState"
import { PageHeader } from "~/components/common/PageHeader"
import { Widget } from "~/components/dashboard/Widget"
import { Balance } from "~/components/metrics/Balance"

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

      <main>
        <div className="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
          <div className="px-4 py-6 sm:px-0">
            <div className="flex flex-col">
              <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                  {accounts.length ? (
                    accounts[0].metrics.length ? (
                      <Widget title="Account balance">
                        <Balance
                          metric={
                            accounts[0].metrics.find(
                              (m) => m.key === "BALANCE"
                            )!
                          }
                        />
                      </Widget>
                    ) : (
                      <EmptyState
                        description="Your account has not metrics yet. Connect the EA to your account to upload your account history."
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
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </>
  )
}
