import { Deal } from "../models/Deal"
import { BaseClient } from "./BaseClient"

export class DealsClient extends BaseClient {
  get(ticket: number) {
    return this.axios.get<Deal>(`/deals/${ticket}`)
  }

  create(deals: Deal | Deal[]) {
    return this.axios.post("/deals", {
      deals: Array.isArray(deals) ? deals : [deals],
    })
  }
}
