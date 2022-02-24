export function safeAdd(a: number | null, b: number | null) {
  return (a ?? 0) + (b ?? 0)
}
