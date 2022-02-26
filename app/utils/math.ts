/**
 * Adds two numbers, defaulting each to zero if null.
 */
export function safeAdd(a: number | null, b: number | null) {
  return (a ?? 0) + (b ?? 0)
}

/**
 * Rounds a number to the given number of decimal places.
 */
export function round(value: number, decimals = 2) {
  const factor = 10 ** decimals
  return Math.round(value * factor) / factor
}
