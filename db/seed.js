db.auth("root", "local")
db = db.getSiblingDB("analyzer")

db.User.insert({
  arn: "arn:user:jii36zh8:",
  createdAt: new Date(),
  email: "mdskelton99@gmail.com",
  name: "Mark Skelton",
  password: "$2b$10$/QBjegkftcQFSIS2soi/uOldyWzcib0V9Qpeu9ArCjPOAsaX5PHYS",
  updatedAt: new Date(),
})

db.Account.insert({
  arn: "arn:account:jii36zh8:ecowczk9",
  number: 123456,
  createdAt: new Date(),
  name: "Growth account",
  token: "74e8u3j1zucq",
  type: "LIVE",
  updatedAt: new Date(),
  userArn: "arn:user:jii36zh8:",
})

db.Deal.createIndex({ accountArn: 1, ticket: 1 }, { unique: true })
