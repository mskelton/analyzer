import { Trade } from "api"
import { expect, test } from "~/fixtures"

test.describe("Trade ingestion", () => {
  test("one trade", async ({ api }) => {
    const res = await api.ingest({
      action: "TRADE_ACTION_DEAL",
      order: "12345",
      orderType: "ORDER_TYPE_BUY",
      symbol: "USDCAD",
      volume: 0.1,
    })

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("multiple trades", async ({ api }) => {
    const res = await api.ingest([
      {
        action: "TRADE_ACTION_DEAL",
        order: "12345",
        orderType: "ORDER_TYPE_BUY",
        symbol: "USDCAD",
        volume: 0.1,
      },
      {
        action: "TRADE_ACTION_DEAL",
        order: "12346",
        orderType: "ORDER_TYPE_SELL",
        symbol: "EURUSD",
        volume: 0.01,
      },
    ])

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("updates an existing trade", async ({ api }) => {
    const res = await api.ingest({
      action: "TRADE_ACTION_DEAL",
      order: "12345",
      orderType: "ORDER_TYPE_BUY",
      symbol: "USDCAD",
      volume: 0.1,
    })

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("fails to ingest trade without required data", async ({ api }) => {
    const res = await api.ingest({ order: "12345" } as Trade)

    expect(res.status).toBe(400)
    expect(res.data).toEqual({
      message: "Ingestion request is missing required fields",
      missingFields: ["action", "orderType", "symbol", "volume"],
    })
  })
})
