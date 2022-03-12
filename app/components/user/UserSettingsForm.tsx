import { User } from "@prisma/client"
import { Link, useLoaderData } from "remix"
import { useFormError } from "~/hooks/useFormError"
import { Alert } from "../common/Alert"
import { TextField } from "../common/TextField"

export function UserSettingsForm() {
  const { user } = useLoaderData<{ user: User }>()
  const { error } = useFormError()

  return (
    <div className="mx-auto max-w-xl py-6 sm:px-6 lg:px-8">
      {error && (
        <Alert className="mb-5" type="danger">
          {error}
        </Alert>
      )}

      <form className="flex flex-col gap-5" method="post">
        <TextField
          autoComplete="name"
          autoFocus
          defaultValue={user.name}
          label="Full name"
          name="name"
          required
          type="text"
        />

        <TextField
          autoComplete="email"
          autoFocus
          defaultValue={user.email}
          label="Email"
          name="email"
          required
          type="text"
        />

        <div className="flex justify-end gap-3">
          <Link className="btn-white" to="/dashboard">
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
  )
}
