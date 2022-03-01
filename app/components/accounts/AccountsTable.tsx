import { Link } from "remix"
import { useAccounts } from "~/hooks/useAccounts"
import { parseArn } from "~/utils/arn"
import { relativeDate } from "~/utils/date"
import { Badge } from "../common/Badge"
import { TableHeader } from "../common/TableHeader"

export function AccountsTable() {
  const { accounts } = useAccounts()

  return (
    <div className="flex flex-col">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
          <div className="overflow-hidden border-b border-gray-200 shadow sm:rounded-lg">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <TableHeader>Name</TableHeader>
                  <TableHeader>Broker</TableHeader>
                  <TableHeader>Type</TableHeader>
                  <TableHeader>Token</TableHeader>
                  <TableHeader>Last Updated</TableHeader>
                  <TableHeader>
                    <span className="sr-only">Edit</span>
                  </TableHeader>
                </tr>
              </thead>

              <tbody className="divide-y divide-gray-200 bg-white">
                {accounts.map((account, idx) => (
                  <tr
                    key={account.id}
                    className={idx % 2 === 0 ? "bg-white" : "bg-gray-50"}
                  >
                    <td className="whitespace-nowrap px-6 py-4 text-sm font-medium text-gray-900">
                      {account.name}
                    </td>

                    <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                      {account.broker}
                    </td>

                    <td className="whitespace-nowrap px-6 py-4">
                      {account.type === "LIVE" ? (
                        <Badge type="success">Live</Badge>
                      ) : (
                        <Badge type="warning">Demo</Badge>
                      )}
                    </td>

                    <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                      <code className="rounded-md bg-gray-100 py-1 px-2 text-xs">
                        {account.token}
                      </code>
                    </td>

                    <td className="whitespace-nowrap px-6 py-4 text-sm text-gray-900">
                      {account.deals.length
                        ? relativeDate(account.deals[0].time)
                        : "Never"}
                    </td>

                    <td className="whitespace-nowrap px-6 py-4 text-right text-sm font-medium">
                      <Link
                        className="text-primary-600 hover:text-primary-900"
                        to={parseArn(account.arn).id}
                      >
                        Edit
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  )
}
