import { ActionFunction, LoaderFunction, MetaFunction } from "remix"
import {
  deleteUser,
  getUser,
  updateUser,
  validateUserData,
} from "~/api/user.server"
import { PageContent } from "~/components/common/PageContent"
import { PageHeader } from "~/components/common/PageHeader"
import { DeleteUser } from "~/components/user/DeleteUser"
import { UserSettingsForm } from "~/components/user/UserSettingsForm"
import { handleError } from "~/utils/errors.server"
import { getUserArn } from "~/utils/session.server"

export const meta: MetaFunction = () => {
  return { title: "User settings" }
}

export const loader: LoaderFunction = async ({ request }) => {
  const user = await getUser(request)

  return { user }
}

export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData()
  const method = formData.get("_method")
  const arn = await getUserArn(request)

  try {
    if (method === "delete") {
      await deleteUser(arn)
    } else {
      const data = await validateUserData(formData)
      await updateUser(arn, data)
    }

    return null
  } catch (err) {
    return handleError(err)
  }
}

export default function UserSettings() {
  return (
    <>
      <PageHeader extra={<DeleteUser />}>User Settings</PageHeader>
      <PageContent>
        <UserSettingsForm />
      </PageContent>
    </>
  )
}
