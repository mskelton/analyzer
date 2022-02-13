import { Deal } from "api"
import { expect, test } from "fixtures"
import { createDeal } from "utils/deal"

test.describe("Deal creation", () => {
  test("single deal", async ({ client }) => {
    const req = createDeal()
    const res = await client.deals.create(req)
    expect(res.status).toBe(201)
    expect(res.data).toBeNull()

    const { data: deal } = await client.deals.get(req.ticket)
    expect(deal.comment).toBe("Integ testing")
    expect(deal.reason).toBe("DEAL_REASON_EXPERT")
  })

  test("multiple deals", async ({ client }) => {
    const req = [
      createDeal({ symbol: "USDCAD", type: "DEAL_TYPE_BUY", volume: 0.1 }),
      createDeal({ symbol: "EURUSD", type: "DEAL_TYPE_SELL", volume: 0.01 }),
    ]
    const res = await client.deals.create(req)
    expect(res.status).toBe(201)
    expect(res.data).toBeNull()

    const { data: deal1 } = await client.deals.get(req[0].ticket)
    expect(deal1.symbol).toBe("USDCAD")
    expect(deal1.type).toBe("DEAL_TYPE_BUY")
    expect(deal1.volume).toBe(0.1)

    const { data: deal2 } = await client.deals.get(req[1].ticket)
    expect(deal2.symbol).toBe("EURUSD")
    expect(deal2.type).toBe("DEAL_TYPE_SELL")
    expect(deal2.volume).toBe(0.01)
  })

  test("fails to create deal without required data", async ({ client }) => {
    const res = await client.deals.create({ ticket: 12345 } as Deal)

    expect(res.status).toBe(400)
    expect(res.data).toEqual({
      message: "deal creation request is missing required fields",
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
