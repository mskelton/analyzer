import { useActionData } from "remix"

export function useFormError(): { error?: string } {
  return useActionData() ?? {}
}
