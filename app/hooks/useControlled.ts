import { useCallback, useRef, useState } from "react"

export interface UseControlledOptions<T> {
  controlled: T | undefined
  default: T | undefined
}

export function useControlled<T>({
  controlled,
  default: defaultProp,
}: UseControlledOptions<T>) {
  const isControlled = useRef(controlled !== undefined)
  const [valueState, setValueState] = useState(defaultProp)
  const value = isControlled.current ? controlled : valueState

  const setValueIfUncontrolled = useCallback((value) => {
    if (!isControlled.current) {
      setValueState(value)
    }
  }, [])

  return [value, setValueIfUncontrolled] as const
}
