/**
 * Returns a new Date object based on a given epoch with the time set to
 * midnight, the start of the current day.
 */
export function midnight(time: number) {
  const date = new Date(time)

  // Everything we do is UTC based.
  date.setUTCHours(0, 0, 0, 0)

  return date
}

/**
 * Returns the number of days between two dates.
 */
export function dateDiff(a: Date | number, b: Date | number) {
  const diff = new Date(a).getTime() - new Date(b).getTime()
  return Math.ceil(Math.abs(diff / 864e5))
}
