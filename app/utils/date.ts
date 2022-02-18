const formatter = new Intl.RelativeTimeFormat(undefined, {
  numeric: "auto",
})

const seconds = 60
const minutes = seconds * 60
const hours = minutes * 24
const days = hours * 7
const weeks = days * 7

export function timeAgo(date: number) {
  const now = new Date().getTime()
  const diff = Math.round((now - date) / 1000)

  switch (true) {
    case diff < seconds:
      return formatter.format(-diff, "seconds")

    case diff < minutes:
      return formatter.format(Math.round(-diff / seconds), "minutes")

    case diff < hours:
      return formatter.format(Math.round(-diff / minutes), "hours")

    case diff < days:
      return formatter.format(Math.round(-diff / hours), "days")

    case diff < weeks:
      return formatter.format(Math.round(-diff / days), "weeks")

    default:
      return new Date(date).toLocaleDateString(undefined, {
        day: "numeric",
        month: "short",
        year: "numeric",
      })
  }
}
