import { InputHTMLAttributes } from "react"

export interface TextFieldProps extends InputHTMLAttributes<HTMLInputElement> {
  extra?: React.ReactNode
  label: string
  name: string
}

export function TextField({ extra, label, name, ...props }: TextFieldProps) {
  return (
    <div>
      <div className="flex justify-between">
        <label
          className="block text-sm font-medium text-gray-700"
          htmlFor={name}
        >
          {label}
        </label>

        {extra}
      </div>

      <input
        className="mt-2 block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-primary-500 focus:outline-none sm:text-sm"
        id={name}
        name={name}
        {...props}
      />
    </div>
  )
}
