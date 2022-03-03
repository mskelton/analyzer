/**
 * Adds two or more numbers, defaulting each to zero if null.
 */
export function safeAdd(...args: (number | null)[]) {
  return args.reduce<number>((acc, b) => acc + (b ?? 0), 0)
}

/**
 * Rounds a number to the given number of decimal places.
 */
export function round(value: number, decimals = 2) {
  const factor = 10 ** decimals
  return Math.round(value * factor) / factor
}
