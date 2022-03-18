import timeAgo from "@mskelton/time-ago"

/**
 * Returns a new Date object based on a given epoch with the time set to
 * midnight, the start of the current day.
 */
export function midnight(time: Date | number) {
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

/**
 * Adjust a date by a given number of days, returning a new date.
 */
export function addDays(date: Date, days: number) {
  return new Date(date.getTime() + days * 864e5)
}

/**
 * Adjust a date by a given number of hours, returning a new date.
 */
export function addHours(date: Date, hours: number) {
  return new Date(date.getTime() + hours * 36e5)
}

/**
 * Formats a date in UTC using month and day only.
 */
export function formatDate(date: Date | string) {
  return new Date(date).toLocaleDateString(undefined, {
    day: "numeric",
    month: "short",
    timeZone: "UTC",
  })
}

/**
 * Formats a date using the relative time format.
 */
export function relativeDate(time: Date | number) {
  return timeAgo(new Date(time), {
    day: "numeric",
    month: "short",
    timeZone: "UTC",
    timeZoneName: "short",
    year: "numeric",
  })
}
