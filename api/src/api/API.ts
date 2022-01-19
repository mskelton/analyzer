import axios, { AxiosInstance } from "axios"
import { Trade } from "~/models/trade"

export class API {
  private axios: AxiosInstance

  constructor() {
    this.axios = axios.create({ baseURL: "https://localhost:3000" })
  }

  ingest(trades: Trade | Trade[]) {
    return this.axios.post("/ingest", {
      trades: Array.isArray(trades) ? trades : [trades],
    })
  }
}
