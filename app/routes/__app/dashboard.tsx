import { Deal } from "@prisma/client"
import { LoaderFunction, MetaFunction, useLoaderData } from "remix"
import { getAccountArn, getAccounts } from "~/api/accounts.server"
import { PageHeader } from "~/components/common/PageHeader"
import { TableHeader } from "~/components/common/TableHeader"
import { db } from "~/db/db.server"
import { parseArn } from "~/utils/arn"
import { timeAgo } from "~/utils/date"

export const meta: MetaFunction = () => {
  return { title: "Dashboard" }
}

export const loader: LoaderFunction = async ({ request }) => {
  const accounts = await getAccounts(request)
  const externalId = parseArn(accounts[0].arn).id
  const accountArn = await getAccountArn(request, externalId)

  const deals = await db.deal.findMany({
    orderBy: { time: "desc" },
    take: 10,
    where: { accountArn },
  })

  return { deals }
}

export default function Dashboard() {
  const { deals } = useLoaderData<{ deals: Deal[] }>()

  return (
    <>
      <PageHeader>Dashboard</PageHeader>

      <main>
        <div className="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
          <div className="px-4 py-6 sm:px-0">
            <div className="flex flex-col">
              <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                  <div className="overflow-hidden border-b border-gray-200 shadow sm:rounded-lg">
                    <table className="min-w-full divide-y divide-gray-200">
                      <thead className="bg-gray-50">
                        <tr>
                          <TableHeader>Ticket</TableHeader>
                          <TableHeader>Symbol</TableHeader>
                          <TableHeader>Volume</TableHeader>
                          <TableHeader>Type</TableHeader>
                          <TableHeader>Price</TableHeader>
                          <TableHeader>Profit</TableHeader>
                          <TableHeader>Time</TableHeader>
                        </tr>
                      </thead>

                      <tbody className="divide-y divide-gray-200 bg-white">
                        {deals.map((deal, idx) => (
                          <tr
                            key={deal.id}
                            className={
                              idx % 2 === 0 ? "bg-white" : "bg-gray-50"
                            }
                          >
                            <td className="whitespace-nowrap px-6 py-4 text-sm font-medium text-gray-900">
                              {deal.ticket}
                            </td>

                            <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                              {deal.symbol}
                            </td>

                            <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                              {deal.volume}
                            </td>

                            <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                              {deal.type}
                            </td>

                            <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                              {deal.price}
                            </td>

                            <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                              ${Math.round((deal.profit ?? 0) * 100) / 100}
                            </td>

                            <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                              {timeAgo(new Date(deal.time))}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </>
  )
}
