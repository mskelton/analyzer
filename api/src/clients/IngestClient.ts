import { Position } from "../models/ingest"
import { BaseClient } from "./BaseClient"

export class IngestClient extends BaseClient {
  updatePosition(position: Position) {
    return this.updatePositions([position])
  }

  updatePositions(positions: Position[]) {
    return this.axios.put<void>("/ingest/positions", { positions })
  }
}
