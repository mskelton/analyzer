import { Order } from "../models/Order"
import { BaseClient } from "./BaseClient"

export class OrdersClient extends BaseClient {
  getOrder(ticket: number) {
    return this.axios.get<Order>(`/orders/${ticket}`)
  }

  updateOrder(order: Order) {
    return this.updateOrders([order])
  }

  updateOrders(orders: Order[]) {
    return this.axios.put<void>("/orders", { orders })
  }
}
