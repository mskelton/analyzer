import { customAlphabet } from "nanoid/async"

/**
 * Generates a random id that can be used for user facing external ids.
 * Generated ids contain only lowercase letters and numbers.
 */
export const generateId = customAlphabet(
  "1234567890abcdefghijklmnopqrstuvwxyz",
  8
)
