/**
 * Format a number as a USD currency string.
 * @param value - The number to format
 * @param digits - The number digits to keep
 */
export function formatCurrency(value: number, digits = 2) {
  const formatter = new Intl.NumberFormat(undefined, {
    currency: "USD",
    maximumFractionDigits: digits,
    style: "currency",
  })

  return formatter.format(value)
}
