import { Link } from "remix"
import { useAccounts } from "~/hooks/useAccounts"
import { parseArn } from "~/utils/arn"
import { relativeDate } from "~/utils/date"
import { Badge } from "../common/Badge"
import { TableHeader } from "../common/TableHeader"

const row = "whitespace-nowrap px-6 py-4 text-sm text-gray-900"

export function AccountsTable() {
  const { accounts } = useAccounts()

  return (
    <div className="relative overflow-x-auto rounded-lg shadow">
      <table className="w-full divide-y divide-gray-200 ">
        <thead className="bg-gray-50">
          <tr>
            <TableHeader>Name</TableHeader>
            <TableHeader>Account number</TableHeader>
            <TableHeader>Type</TableHeader>
            <TableHeader>Token</TableHeader>
            <TableHeader>Last updated</TableHeader>
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
              <td className={`${row} font-medium`}>{account.name}</td>
              <td className={row}>{account.number}</td>

              <td className="whitespace-nowrap px-6 py-4">
                {account.type === "LIVE" ? (
                  <Badge type="success">Live</Badge>
                ) : (
                  <Badge type="warning">Demo</Badge>
                )}
              </td>

              <td className={row}>
                <code className="rounded-md bg-gray-100 py-1 px-2 text-xs">
                  {account.token}
                </code>
              </td>

              <td className={row}>
                {account.deals.length
                  ? relativeDate(account.deals[0].time)
                  : "Never"}
              </td>

              <td className={`${row} text-right font-medium`}>
                <Link className="link" to={parseArn(account.arn).id}>
                  Edit
                </Link>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
