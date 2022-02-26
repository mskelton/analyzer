const formatter = new Intl.NumberFormat(undefined, {
  currency: "USD",
  maximumFractionDigits: 0,
  style: "currency",
})

export function formatCurrency(value: number) {
  return formatter.format(value)
}
