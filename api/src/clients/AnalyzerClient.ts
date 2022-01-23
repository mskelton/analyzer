import axios from "axios"
import { OrdersClient } from "./OrdersClient"

export class AnalyzerClient {
  public orders: OrdersClient

  constructor() {
    const instance = axios.create({ baseURL: "http://localhost:3001" })

    this.orders = new OrdersClient(instance)
  }
}
