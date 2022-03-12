import { expect, test } from "../../fixtures"
import { createDeal } from "../../utils/deal"

test.describe("Deal creation", () => {
  test.skip("single deal", async () => {
    const req = createDeal()
    const res = await create(req)
    expect(res.status).toBe(201)
    expect(res.data).toBeNull()

    const { data: deal } = await get(req.ticket)
    expect(deal.comment).toBe("Integ testing")
    expect(deal.reason).toBe("DEAL_REASON_EXPERT")
  })

  test.skip("multiple deals", async () => {
    const req = [
      createDeal({ symbol: "USDCAD", type: "DEAL_TYPE_BUY", volume: 0.1 }),
      createDeal({ symbol: "EURUSD", type: "DEAL_TYPE_SELL", volume: 0.01 }),
    ]
    const res = await create(req)
    expect(res.status).toBe(201)
    expect(res.data).toBeNull()

    const { data: deal1 } = await get(req[0].ticket)
    expect(deal1.symbol).toBe("USDCAD")
    expect(deal1.type).toBe("DEAL_TYPE_BUY")
    expect(deal1.volume).toBe(0.1)

    const { data: deal2 } = await get(req[1].ticket)
    expect(deal2.symbol).toBe("EURUSD")
    expect(deal2.type).toBe("DEAL_TYPE_SELL")
    expect(deal2.volume).toBe(0.01)
  })

  test.skip("fails to create deal without required data", async () => {
    const res = await create({ ticket: 12345 })

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
