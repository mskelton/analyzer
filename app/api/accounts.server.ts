export function getAccounts() {
  return Promise.resolve([
    {
      broker: "Masari Capital",
      brokerAccount: 350249,
      id: "asdf",
      lastUpdated: new Date("2021-02-02").getTime(),
      name: "Moderately aggressive",
      status: "inactive" as const,
      type: "live" as const,
    },
    {
      broker: "OspreyFX",
      brokerAccount: 366592,
      id: "kbasd",
      lastUpdated: new Date("2022-02-15").getTime(),
      name: "Moderately aggressive",
      status: "active" as const,
      type: "live" as const,
    },
    {
      broker: "OspreyFX",
      brokerAccount: 366592,
      id: "asdd",
      lastUpdated: new Date("2022-02-01").getTime(),
      name: "3.0 trial",
      status: "active" as const,
      type: "demo" as const,
    },
  ])
}
