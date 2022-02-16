import { User } from "../models/User"
import { BaseClient } from "./BaseClient"

export class AuthClient extends BaseClient {
  login(email: string, password: string) {
    return this.axios.post<User>("/auth/login", { email, password })
  }

  signUp(name: string, email: string, password: string) {
    return this.axios.post<User>("/auth/signup", { email, name, password })
  }
}
