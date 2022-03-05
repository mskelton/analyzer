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
