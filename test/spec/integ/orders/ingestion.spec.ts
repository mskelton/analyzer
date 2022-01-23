import { Order } from "api"
import { expect, test } from "fixtures"
import { createOrder } from "utils/order"

test.describe("Order ingestion", () => {
  test("single order", async ({ client }) => {
    const req = createOrder()
    const res = await client.orders.ingest(req)
    expect(res.status).toBe(203)
    expect(res.data).toBeNull()

    const { data: order } = await client.orders.getOrder(req.ticket)
    expect(order.comment).toBe("Integ testing")
    expect(order.reason).toBe("ORDER_REASON_EXPERT")
  })

  test("multiple orders", async ({ client }) => {
    const req = [
      createOrder({ symbol: "USDCAD", type: "ORDER_TYPE_BUY", volume: 0.1 }),
      createOrder({ symbol: "EURUSD", type: "ORDER_TYPE_SELL", volume: 0.01 }),
    ]
    const res = await client.orders.ingest(req)
    expect(res.status).toBe(203)
    expect(res.data).toBeNull()

    const { data: order1 } = await client.orders.getOrder(req[0].ticket)
    expect(order1.symbol).toBe("USDCAD")
    expect(order1.type).toBe("ORDER_TYPE_BUY")
    expect(order1.volume).toBe(0.1)

    const { data: order2 } = await client.orders.getOrder(req[1].ticket)
    expect(order2.symbol).toBe("EURUSD")
    expect(order2.type).toBe("ORDER_TYPE_SELL")
    expect(order2.volume).toBe(0.01)
  })

  test("updates an existing order", async ({ client }) => {
    const req = createOrder({ pricing: { open: 1.1 } })
    await client.orders.ingest(req)

    const res = await client.orders.ingest({
      ...req,
      comment: "updated",
      pricing: { current: 1.2, open: 1.1 },
    })
    expect(res.status).toBe(203)
    expect(res.data).toBeNull()

    const { data: order } = await client.orders.getOrder(req.ticket)
    expect(order.comment).toBe("updated")
    expect(order.pricing.current).toBe(1.2)
  })

  test("fails to ingest order without required data", async ({ client }) => {
    const res = await client.orders.ingest({ ticket: 12345 } as Order)

    expect(res.status).toBe(400)
    expect(res.data).toEqual({
      message: "Ingestion request is missing required fields",
      missingFields: [
        "pricing.open",
        "reason",
        "symbol",
        "timing.setup",
        "type",
        "volume",
      ],
    })
  })
})
