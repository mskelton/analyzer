export type ArnType = "user" | "account" | "deal"

export function createArn(type: ArnType, userId: string, id: string | number) {
  return `arn:${type}:${userId}:${id}`
}

export function parseArn(arn: string) {
  const [_, type, userId, id] = arn.split(":")

  return {
    id,
    type: type as ArnType,
    userId,
  }
}

export const getArnId = (arn: string) => parseArn(arn).id
