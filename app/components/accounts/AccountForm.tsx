import { Account } from "@prisma/client"
import { Link, useLoaderData } from "remix"
import { useFormError } from "~/hooks/useFormError"
import { Alert } from "../common/Alert"
import { Select } from "../common/Select"
import { TextField } from "../common/TextField"

export function AccountForm() {
  const { error } = useFormError()
  const data = useLoaderData<{ account: Account } | undefined>()

  return (
    <main>
      <div className="mx-auto max-w-xl py-6 sm:px-6 lg:px-8">
        <div className="px-4 py-6 sm:px-0">
          {error && (
            <Alert className="mb-5" type="danger">
              {error}
            </Alert>
          )}

          <form className="flex flex-col gap-5" method="post">
            <TextField
              autoComplete="off"
              autoFocus
              defaultValue={data?.account.name}
              label="Account name"
              name="name"
              placeholder="ex. Growth account"
              required
              type="text"
            />

            <TextField
              autoComplete="off"
              defaultValue={data?.account.number ?? undefined}
              label="Account number"
              name="number"
              placeholder="ex. 123456"
              type="number"
            />

            <Select
              defaultValue={data?.account.type ?? "LIVE"}
              label="Account type"
              name="type"
              options={[
                { id: "LIVE", name: "Live" },
                { id: "DEMO", name: "Demo" },
              ]}
            />

            <div className="flex justify-end gap-3">
              <Link className="btn-white" to="/accounts">
                Cancel
              </Link>

              <button
                className="btn-primary"
                name="_method"
                type="submit"
                value="save"
              >
                Save
              </button>
            </div>
          </form>
        </div>
      </div>
    </main>
  )
}
