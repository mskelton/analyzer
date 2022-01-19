import axios, { AxiosInstance } from "axios"
import { Trade } from "../models/trade"

export class API {
  #axios: AxiosInstance

  constructor() {
    this.#axios = axios.create({
      baseURL: "https://localhost:3000",
    })
  }

  login(username: string, password: string) {
    return this.#axios.post("/auth/login", { password, username })
  }

  ingest(trades: Trade | Trade[]) {
    return this.#axios.post("/ingest", {
      trades: Array.isArray(trades) ? trades : [trades],
    })
  }
}
