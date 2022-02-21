import { Dialog, Transition } from "@headlessui/react"
import { ExclamationIcon } from "@heroicons/react/outline"
import { Fragment, useRef } from "react"

export interface ModalProps {
  children?: React.ReactNode
  onCancel(): void
  onSubmit(): void
  open: boolean
  submitClassName: string
  submitText: string
  title: React.ReactNode
}

export default function Modal({
  children,
  onCancel,
  onSubmit,
  open,
  submitClassName,
  submitText,
  title,
}: ModalProps) {
  const cancelButtonRef = useRef<HTMLButtonElement>(null!)

  return (
    <Transition.Root as={Fragment} show={open}>
      <Dialog
        className="fixed inset-0 z-10 overflow-y-auto"
        initialFocus={cancelButtonRef}
        onClose={onCancel}
      >
        <div className="flex min-h-screen items-end justify-center px-4 pt-4 pb-20 text-center sm:block sm:p-0">
          <Transition.Child
            as={Fragment}
            enter="ease-out duration-300"
            enterFrom="opacity-0"
            enterTo="opacity-100"
            leave="ease-in duration-200"
            leaveFrom="opacity-100"
            leaveTo="opacity-0"
          >
            <Dialog.Overlay className="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" />
          </Transition.Child>

          <span
            aria-hidden="true"
            className="hidden sm:inline-block sm:h-screen sm:align-middle"
          >
            &#8203;
          </span>

          <Transition.Child
            as={Fragment}
            enter="ease-out duration-300"
            enterFrom="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
            enterTo="opacity-100 translate-y-0 sm:scale-100"
            leave="ease-in duration-200"
            leaveFrom="opacity-100 translate-y-0 sm:scale-100"
            leaveTo="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
          >
            <div className="inline-block transform overflow-hidden rounded-lg bg-white px-4 pt-5 pb-4 text-left align-bottom shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg sm:p-6 sm:align-middle">
              <div className="sm:flex sm:items-start">
                <div className="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
                  <ExclamationIcon
                    aria-hidden="true"
                    className="h-6 w-6 text-red-600"
                  />
                </div>

                <div className="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                  <Dialog.Title
                    as="h3"
                    className="text-lg font-medium leading-6 text-gray-900"
                  >
                    {title}
                  </Dialog.Title>

                  <div className="mt-2">
                    <p className="text-sm text-gray-500">{children}</p>
                  </div>
                </div>
              </div>

              <div className="mt-5 sm:mt-4 sm:flex sm:flex-row-reverse">
                <button
                  className={`${submitClassName} w-full justify-center sm:ml-3 sm:w-auto sm:text-sm`}
                  onClick={onSubmit}
                  type="button"
                >
                  {submitText}
                </button>

                <button
                  ref={cancelButtonRef}
                  className="btn-white mt-3 w-full justify-center sm:mt-0 sm:w-auto sm:text-sm"
                  onClick={onCancel}
                  type="button"
                >
                  Cancel
                </button>
              </div>
            </div>
          </Transition.Child>
        </div>
      </Dialog>
    </Transition.Root>
  )
}
