import axios from "axios"
import { IngestClient } from "./IngestClient"

export class AnalyzerClient {
  public ingest: IngestClient

  constructor() {
    const instance = axios.create({ baseURL: "https://localhost:3001" })

    this.ingest = new IngestClient(instance)
  }
}
