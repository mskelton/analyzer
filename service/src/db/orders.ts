import { Order } from "api"
import { model, QueryWithHelpers, Schema } from "mongoose"

const schema = new Schema({
  comment: String,
  magic: Number,
  pricing: {
    current: Number,
    open: { required: true, type: Number },
    stopLimit: Number,
  },
  reason: { required: true, type: String },
  sl: Number,
  symbol: { required: true, type: String },
  ticket: { required: true, type: Number },
  timing: {
    done: Number,
    expiration: Number,
    setup: { required: true, type: Number },
  },
  tp: Number,
  type: { required: true, type: String },
  volume: { required: true, type: Number },
})

// schema.query.byTicket = function (
//   this: QueryWithHelpers<string, string>,
//   ticket: number
// ) {
//   return this.where({ ticket })
// }

export const OrderModel = model<Order>("Order", schema)
