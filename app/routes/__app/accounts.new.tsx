import { ActionFunction, Link, redirect } from "remix"
import { PageHeader } from "~/components/common/PageHeader"
import { Select } from "~/components/common/Select"
import { TextField } from "~/components/common/TextField"

export const action: ActionFunction = async ({ request }) => {
  console.log("request", request)

  return redirect("..")
}

export default function NewAccount() {
  return (
    <>
      <PageHeader>Create Account</PageHeader>

      <main>
        <div className="mx-auto max-w-xl py-6 sm:px-6 lg:px-8">
          <div className="px-4 py-6 sm:px-0">
            <form className="flex flex-col gap-5" method="post">
              <TextField
                label="Account name"
                name="name"
                placeholder="ex. Growth account"
                required
                type="text"
              />

              <TextField
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
