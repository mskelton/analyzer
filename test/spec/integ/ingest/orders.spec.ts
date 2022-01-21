import { Order } from "api"
import { expect, test } from "fixtures"
import { createOrder } from "utils/order"

test.describe("Order ingestion", () => {
  test("single order", async ({ client }) => {
    const res = await client.ingest.updateOrder(createOrder())

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("multiple orders", async ({ client }) => {
    const res = await client.ingest.updateOrders([
      createOrder({
        symbol: "USDCAD",
        type: "ORDER_TYPE_BUY",
        volume: 0.1,
      }),
      createOrder({
        symbol: "EURUSD",
        type: "ORDER_TYPE_SELL",
        volume: 0.01,
      }),
    ])

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("updates an existing order", async ({ client }) => {
    const order = createOrder({ pricing: { open: 1.1 } })
    await client.ingest.updateOrder(order)

    const res = await client.ingest.updateOrder({
      ...order,
      comment: "updated",
      pricing: {
        current: 1.2,
        open: 1.1,
      },
    })

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("fails to ingest order without required data", async ({ client }) => {
    const res = await client.ingest.updateOrder({ ticket: 12345 } as Order)

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
