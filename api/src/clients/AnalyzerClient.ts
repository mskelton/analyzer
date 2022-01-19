import axios, { AxiosInstance } from "axios"
import { Trade } from "../models/trade"

export class AnalyzerClient {
  private axios: AxiosInstance

  constructor() {
    this.axios = axios.create({ baseURL: "https://localhost:3001" })
  }

  ingest(trades: Trade | Trade[]) {
    return this.axios.post("/ingest", {
      trades: Array.isArray(trades) ? trades : [trades],
    })
  }
}
