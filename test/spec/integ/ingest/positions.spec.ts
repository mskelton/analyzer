import { expect, test } from "fixtures"

test.describe("Position ingestion", () => {
  test("single position", async ({ client }) => {
    const res = await client.ingest.updatePosition({
      symbol: "USDCAD",
      ticket: "12345",
      type: "POSITION_TYPE_BUY",
      volume: 0.1,
    })

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("multiple positions", async ({ client }) => {
    const res = await client.ingest.updatePositions([
      {
        symbol: "USDCAD",
        ticket: "12345",
        type: "POSITION_TYPE_BUY",
        volume: 0.1,
      },
      {
        symbol: "EURUSD",
        ticket: "12346",
        type: "POSITION_TYPE_SELL",
        volume: 0.01,
      },
    ])

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("updates an existing position", async ({ client }) => {
    const res = await client.ingest.updatePositions({
      symbol: "USDCAD",
      ticket: "12345",
      type: "POSITION_TYPE_BUY",
      volume: 0.1,
    })

    expect(res.status).toBe(203)
    expect(res.data).toBeNull()
  })

  test("fails to ingest position without required data", async ({ client }) => {
    const res = await client.ingest.updatePositions({
      ticket: "12345",
    } as position)

    expect(res.status).toBe(400)
    expect(res.data).toEqual({
      message: "Ingestion request is missing required fields",
      missingFields: ["action", "type", "symbol", "volume"],
    })
  })
})
