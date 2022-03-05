import { Listbox, Transition } from "@headlessui/react"
import clsx from "clsx"
import { Fragment } from "react"
import { HiCheck, HiSelector } from "react-icons/hi"
import { useControlled } from "~/hooks/useControlled"

interface Option {
  id: string
  name: string
}

export interface SelectProps {
  defaultValue?: string
  hideLabel?: true
  label: string
  name?: string
  onChange?(value: string | undefined): void
  options: Option[]
  value?: string
}

export function Select({
  defaultValue,
  hideLabel,
  label,
  name,
  onChange,
  options,
  value: valueProp,
}: SelectProps) {
  const [value, setValue] = useControlled({
    controlled: valueProp,
    default: defaultValue,
  })
  const selectedOption = options.find((o) => o.id === value)

  function handleChange(option: Option) {
    setValue(option.id)
    onChange?.(option.id)
  }

  return (
    <Listbox onChange={handleChange} value={selectedOption}>
      {({ open }) => (
        <div>
          <input name={name} type="hidden" value={value} />

          <Listbox.Label
            className={clsx(
              "mb-2 text-sm font-medium text-gray-700",
              hideLabel ? "hidden" : "block"
            )}
          >
            {label}
          </Listbox.Label>

          <div className="relative">
            <Listbox.Button className="relative w-full cursor-default rounded-md border border-gray-300 bg-white py-2 pl-3 pr-10 text-left shadow-sm focus:border-primary-500 focus:outline-none focus:ring-1 focus:ring-primary-500 sm:text-sm">
              <span className="block truncate">{selectedOption?.name}</span>
              <span className="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-2">
                <HiSelector
                  aria-hidden="true"
                  className="h-5 w-5 text-gray-400"
                />
              </span>
            </Listbox.Button>

            <Transition
              as={Fragment}
              leave="transition ease-in duration-100"
              leaveFrom="opacity-100"
              leaveTo="opacity-0"
              show={open}
            >
              <Listbox.Options className="absolute z-10 mt-1 max-h-60 w-full overflow-auto rounded-md bg-white py-1 text-base shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none sm:text-sm">
                {options.map((option) => (
                  <Listbox.Option
                    key={option.id}
                    className={({ active }) =>
                      clsx(
                        active ? "bg-primary-600 text-white" : "text-gray-900",
                        "relative cursor-default select-none py-2 pl-3 pr-9"
                      )
                    }
                    value={option}
                  >
                    {({ active, selected }) => (
                      <>
                        <span
                          className={clsx(
                            selected ? "font-semibold" : "font-normal",
                            "block truncate"
                          )}
                        >
                          {option.name}
                        </span>

                        {selected ? (
                          <span
                            className={clsx(
                              active ? "text-white" : "text-primary-600",
                              "absolute inset-y-0 right-0 flex items-center pr-4"
                            )}
                          >
                            <HiCheck aria-hidden="true" className="h-5 w-5" />
                          </span>
                        ) : null}
                      </>
                    )}
                  </Listbox.Option>
                ))}
              </Listbox.Options>
            </Transition>
          </div>
        </div>
      )}
    </Listbox>
  )
}
