import { DeleteButton } from "../common/DeleteButton"

export function DeleteUser() {
  return (
    <DeleteButton title="Delete account">
      Are you sure you want to delete your user account? All user data will be
      permanently removed. This action cannot be undone.
    </DeleteButton>
  )
}
