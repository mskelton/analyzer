import { ActionFunction, json, Link, redirect, useActionData } from "remix"
import invariant from "tiny-invariant"
import { createAccount } from "~/api/accounts.server"
import { Alert } from "~/components/common/Alert"
import { PageHeader } from "~/components/common/PageHeader"
import { Select } from "~/components/common/Select"
import { TextField } from "~/components/common/TextField"

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()
  const name = formData.get("name")
  const broker = formData.get("broker")
  const type = formData.get("type")

  // Validate form data
  invariant(typeof name === "string")
  invariant(typeof broker === "string")
  invariant(type === "DEMO" || type === "LIVE")

  try {
    await createAccount(request, { broker, name, type })

    return redirect("/accounts")
  } catch (err) {
    return json({ error: (err as Error).message }, { status: 400 })
  }
}

export default function NewAccount() {
  const data = useActionData<{ error: string }>()

  return (
    <>
      <PageHeader>Create Account</PageHeader>

      <main>
        <div className="mx-auto max-w-xl py-6 sm:px-6 lg:px-8">
          <div className="px-4 py-6 sm:px-0">
            {data?.error && (
              <Alert className="mb-5" type="danger">
                {data.error}
              </Alert>
            )}

            <form className="flex flex-col gap-5" method="post">
              <TextField
                autoComplete="off"
                label="Account name"
                name="name"
                placeholder="ex. Growth account"
                required
                type="text"
              />

              <TextField
                autoComplete="off"
                label="Broker"
                name="broker"
                placeholder="ex. OspreyFX"
                required
                type="text"
              />

              <Select
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

                <button className="btn-primary" type="submit">
                  Save
                </button>
              </div>
            </form>
          </div>
        </div>
      </main>
    </>
  )
}
