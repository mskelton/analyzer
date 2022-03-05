import {
  CategoryScale,
  Chart,
  LinearScale,
  LineElement,
  PointElement,
  Tooltip,
} from "chart.js"

Chart.register(CategoryScale, LinearScale, PointElement, LineElement, Tooltip)
