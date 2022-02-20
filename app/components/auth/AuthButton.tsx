import cx from "clsx"
import { ButtonHTMLAttributes } from "react"

export function AuthButton({
  className,
  ...props
}: ButtonHTMLAttributes<HTMLButtonElement>) {
  return (
    <button
      className={cx("btn-primary mt-2 block w-full rounded", className)}
      {...props}
    />
  )
}
