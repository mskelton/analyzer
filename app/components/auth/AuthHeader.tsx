import { ReactNode } from "react"
import { Link } from "remix"
import { AnalyzerLogo } from "../common/AnalyzerLogo"

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
    <div className="sm:mx-auto sm:w-full sm:max-w-md">
      <AnalyzerLogo className="mx-auto h-12 w-auto" />

      <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
        {children}
      </h2>

      <p className="mt-2 text-center text-sm text-gray-600">
        {hint}{" "}
        <Link className="link font-medium" to={hintLink}>
          {hintLinkText}
        </Link>
      </p>
    </div>
  )
}
