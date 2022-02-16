import { InputHTMLAttributes } from "react"

export interface TextFieldProps extends InputHTMLAttributes<HTMLInputElement> {
  label: string
  name: string
}

export function TextField({ label, name, ...props }: TextFieldProps) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700" htmlFor={name}>
        {label}
      </label>

      <input
        className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 sm:text-sm"
        id={name}
        name={name}
        {...props}
      />
    </div>
  )
}
