import { Link, LoaderFunction } from "remix"
import { getAccounts } from "~/api/accounts.server"
import { AccountsTable } from "~/components/accounts/AccountsTable"

export const loader: LoaderFunction = async () => {
  return { accounts: await getAccounts() }
}

export default function Accounts() {
  return (
    <>
      <header className="bg-white shadow">
        <div className="mx-auto flex max-w-7xl items-center justify-between py-6 px-4 sm:px-6 lg:px-8">
          <h1 className="text-3xl font-bold text-gray-900">Accounts</h1>

          <Link className="btn-primary" to="create">
            Add account
          </Link>
        </div>
      </header>

      <main>
        <div className="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
          <div className="px-4 py-6 sm:px-0">
            <AccountsTable />
          </div>
        </div>
      </main>
    </>
  )
}
