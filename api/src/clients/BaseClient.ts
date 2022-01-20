import { AxiosInstance } from "axios"

export class BaseClient {
  constructor(protected axios: AxiosInstance) {}
}
