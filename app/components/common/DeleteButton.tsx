import { useState } from "react"
import { useSubmit } from "remix"
import Modal from "../common/Modal"

export interface DeleteButtonProps {
  children: React.ReactNode
  title: string
}

export function DeleteButton({ children, title }: DeleteButtonProps) {
  const [open, setOpen] = useState(false)
  const submit = useSubmit()

  return (
    <>
      <button className="btn-danger btn-small" onClick={() => setOpen(true)}>
        {title}
      </button>

      <Modal
        onCancel={() => setOpen(false)}
        onSubmit={() => submit({ _method: "delete" }, { method: "post" })}
        open={open}
        submitClassName="btn-danger"
        submitText="Delete"
        title={title}
      >
        {children}
      </Modal>
    </>
  )
}
