import { Order } from "../models/ingest"
import { BaseClient } from "./BaseClient"

export class IngestClient extends BaseClient {
  updateOrder(order: Order) {
    return this.updateOrders([order])
  }

  updateOrders(orders: Order[]) {
    return this.axios.put<void>("/ingest/orders", { orders })
  }
}
