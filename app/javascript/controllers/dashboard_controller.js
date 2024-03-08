import { Controller } from "@hotwired/stimulus"
import {Chart, registerables } from 'chart.js'

Chart.register(...registerables)

// Connects to data-controller="dashboard"
export default class extends Controller {
  static values = { revenue: Array }

  initialize() {
    console.log("connected to the dashboard controller")
    // const data = [0, 20, 30, 40, 50, 60, 70]
    // const labels = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]

    const data = this.revenueValue.map((item) => item[1]/100.0)
    const labels = this.revenueValue.map((item) => item[0])

    const ctx = document.getElementById('revenueChart')

    new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'Revenue £',
          data: data,
          borderWidth: 3,
          fill: true
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false
          }
        },
        scales: {
          x: {
            grid: {
              display: false
            }
          },
          y: {
            border: {
              dash: [5, 5]
            },
            grid: {
              color: "#d4f3ef"
            },
            beginAtZero: true
          }
        }
      }
    })

  }
}