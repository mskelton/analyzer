import axios from "axios"
import { AuthClient } from "./AuthClient"
import { DealsClient } from "./DealClient"

export class AnalyzerClient {
  public auth: AuthClient
  public deals: DealsClient

  constructor() {
    const instance = axios.create({ baseURL: "http://localhost:3001" })

    this.auth = new AuthClient(instance)
    this.deals = new DealsClient(instance)
  }
}
