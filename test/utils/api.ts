import { Deal } from "@prisma/client"
import { request } from "./request"

export class API {
  createDeals(token: string, deals: Partial<Deal>[]) {
    return request("/deals", {
      body: JSON.stringify({ deals }),
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      method: "POST",
    })
  }

  createDeal(token: string, deal: Partial<Deal>) {
    return this.createDeals(token, [deal])
  }

  getDeal(token: string, ticket: number) {
    return request<Deal>(`/deals/${ticket}`, {
      headers: { Authorization: `Bearer ${token}` },
      method: "GET",
    })
  }

  async lastUpdated(token: string) {
    const res = await request<string>("/deals/last-updated", {
      headers: { Authorization: `Bearer ${token}` },
      method: "GET",
    })

    return +res.data
  }
}
