/**
 * This function accepts a metric and aggregates the data so that each day
 * includes the data from the day before. This is useful for displaying metrics
 * such as current balance over time.
 */
export function aggregate(metric: number[]) {
  return metric.reduce<number[]>((acc, cur, i) => {
    acc[i] = (acc[i - 1] ?? 0) + cur
    return acc
  }, [])
}

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

/**
 * Format a number as a percentage string.
 * @param value - The number to format
 */
export function formatPercentage(value: number) {
  const formatter = new Intl.NumberFormat(undefined, {
    maximumFractionDigits: 2,
    style: "percent",
  })

  return formatter.format(value / 100)
}
