import { Order } from "../models/Order"
import { BaseClient } from "./BaseClient"

export class OrdersClient extends BaseClient {
  getOrder(ticket: number) {
    return this.axios.get<Order>(`/orders/${ticket}`)
  }

  ingest(orders: Order | Order[]) {
    return this.axios.post("/orders", {
      orders: Array.isArray(orders) ? orders : [orders],
    })
  }
}
