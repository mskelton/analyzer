import { ReactNode } from "react"
import { Link } from "react-router-dom"

export interface AuthHeaderProps {
  children: ReactNode
  hint: string
  hintLink: string
  hintLinkText: string
}

export function AuthHeader({
  children,
  hint,
  hintLink,
  hintLinkText,
}: AuthHeaderProps) {
  return (
    <div>
      <img
        alt="Analyzer"
        className="mx-auto h-12 w-auto"
        src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
      />

      <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
        {children}
      </h2>

      <p className="mt-2 text-center text-sm text-gray-600">
        {hint}{" "}
        <Link
          className="font-medium text-primary-600 hover:text-primary-500"
          to={hintLink}
        >
          {hintLinkText}
        </Link>
      </p>
    </div>
  )
}
