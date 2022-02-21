export type ArnType = "user" | "account" | "deal"

export function createArn(type: ArnType, userId: string, resourceId = "") {
  return `arn:${type}:${userId}:${resourceId}`
}

export function parseArn(arn: string) {
  const [_, type, userId, resourceId] = arn.split(":")

  return {
    resourceId,
    type: type as ArnType,
    userId,
  }
}
