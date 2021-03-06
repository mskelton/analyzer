import { DeleteButton } from "../common/DeleteButton"

export function DeleteAccount() {
  return (
    <DeleteButton title="Delete account">
      Are you sure you want to delete this account? All account data will be
      permanently removed. This action cannot be undone.
    </DeleteButton>
  )
}
