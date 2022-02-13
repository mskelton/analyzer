import axios from "axios"
import { DealsClient } from "./DealClient"

export class AnalyzerClient {
  public deals: DealsClient

  constructor() {
    const instance = axios.create({ baseURL: "http://localhost:3001" })

    this.deals = new DealsClient(instance)
  }
}
