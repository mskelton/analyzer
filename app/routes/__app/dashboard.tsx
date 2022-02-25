import { Account } from "@prisma/client"
import { LoaderFunction, MetaFunction, useLoaderData } from "remix"
import { getAccounts } from "~/api/accounts.server"
import { PageHeader } from "~/components/common/PageHeader"
import { Stat } from "~/components/metrics/Stat"

export const meta: MetaFunction = () => {
  return { title: "Dashboard" }
}

export const loader: LoaderFunction = async ({ request }) => {
  const accounts = await getAccounts(request)

  return { accounts }
}

export default function Dashboard() {
  const { accounts } = useLoaderData<{ accounts: Account[] }>()

  accounts[0].metrics = [
    accounts[0].metrics[0],
    accounts[0].metrics[0],
    accounts[0].metrics[0],
  ]

  const stats = accounts[0].metrics.map((metric) => {
    const total = metric.value.reduce((a, b) => a + b, 0)

    return {
      change: "10%",
      changeType: "increase",
      name: "Balance",
      previousStat: 0,
      stat: "$" + Math.round(total * 100) / 100,
    }
  })

  return (
    <>
      <PageHeader>Dashboard</PageHeader>

      <main>
        <div className="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
          <div className="px-4 py-6 sm:px-0">
            <div className="flex flex-col">
              <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                  <Stat stats={stats} />
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </>
  )
}
