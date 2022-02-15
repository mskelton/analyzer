import { MetaFunction } from "remix"
import { seo } from "../utils/seo"

export const meta: MetaFunction = () => {
  return seo({
    description: `Analyzer is the leading open-source Forex trading analysis and sharing tool.`,
    title: "Analyzer",
  })
}

export default function Home() {
  return (
    <div data-testid="home">
      <h1>Home</h1>
    </div>
  )
}
