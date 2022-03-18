import { useFormError } from "~/hooks/useFormError"
import { Alert } from "./Alert"

export function FormError() {
  const { error } = useFormError()

  return error ? (
    <Alert className="mb-6" type="danger">
      {error}
    </Alert>
  ) : null
}
