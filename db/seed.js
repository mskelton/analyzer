db.auth("root", "local")
db = db.getSiblingDB("analyzer")

db.Account.insert({
  arn: "arn:account:jii36zh8:ecowczk9",
  userArn: "arn:user:jii36zh8:",
  token: "74e8u3j1zucq",
  name: "Growth account",
  broker: "OspreyFX",
  type: "LIVE",
})

db.User.insert({
  arn: "arn:user:jii36zh8:",
  email: "mdskelton99@gmail.com",
  password: "$2b$10$/QBjegkftcQFSIS2soi/uOldyWzcib0V9Qpeu9ArCjPOAsaX5PHYS",
  name: "Mark Skelton",
})
