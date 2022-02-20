import { MetaFunction } from "remix"
import { seo } from "../utils/seo"

export const meta: MetaFunction = () => {
  return seo({
    description: `Learn more about the Analyzer project and it's awesome features!`,
    title: "About",
  })
}

export default function About() {
  return <div data-testid="about">About</div>
}
