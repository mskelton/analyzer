import { useState } from "react"
import { useSubmit } from "remix"
import Modal from "../common/Modal"

export function DeleteAccount() {
  const [open, setOpen] = useState(false)
  const submit = useSubmit()

  return (
    <>
      <button className="btn-danger btn-small" onClick={() => setOpen(true)}>
        Delete account
      </button>

      <Modal
        onCancel={() => setOpen(false)}
        onSubmit={() => submit({ _method: "delete" }, { method: "post" })}
        open={open}
        submitClassName="btn-danger"
        submitText="Delete"
        title="Delete account"
      >
        Are you sure you want to delete this account? All account data will be
        permanently removed. This action cannot be undone.
      </Modal>
    </>
  )
}
