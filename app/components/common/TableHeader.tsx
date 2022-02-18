export interface TableHeaderProps {
  children: React.ReactNode
}

export function TableHeader({ children }: TableHeaderProps) {
  return (
    <th
      className="px-6 py-3 text-left text-xs font-bold uppercase tracking-wider text-gray-500"
      scope="col"
    >
      {children}
    </th>
  )
}
