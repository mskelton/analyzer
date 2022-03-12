import { expect, test } from "pw:fixtures"
import { buildDeal } from "pw:utils"

test.describe("Deal creation", () => {
  test.skip("single deal", async ({ account, api }) => {
    const deal = buildDeal()
    const res = await api.createDeal(account.token, deal)
    expect(res.status).toBe(201)
    expect(res.data).toBeNull()

    const { data } = await api.getDeal(account.token, deal.ticket)
    expect(data.comment).toBe("Integ testing")
    expect(data.reason).toBe("DEAL_REASON_EXPERT")
  })

  test.skip("multiple deals", async ({ account, api }) => {
    const req = [
      buildDeal({ symbol: "USDCAD", type: "DEAL_TYPE_BUY", volume: 0.1 }),
      buildDeal({ symbol: "EURUSD", type: "DEAL_TYPE_SELL", volume: 0.01 }),
    ]
    const res = await api.createDeals(account.token, req)
    expect(res.status).toBe(201)
    expect(res.data).toBeNull()

    const { data: deal1 } = await api.getDeal(account.token, req[0].ticket)
    expect(deal1.symbol).toBe("USDCAD")
    expect(deal1.type).toBe("DEAL_TYPE_BUY")
    expect(deal1.volume).toBe(0.1)

    const { data: deal2 } = await api.getDeal(account.token, req[1].ticket)
    expect(deal2.symbol).toBe("EURUSD")
    expect(deal2.type).toBe("DEAL_TYPE_SELL")
    expect(deal2.volume).toBe(0.01)
  })

  test.skip("fails to create deal without required data", async ({
    account,
    api,
  }) => {
    const res = await api.createDeal(account.token, { ticket: 12345 })

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
