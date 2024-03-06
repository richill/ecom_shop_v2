import { Controller } from "@hotwired/stimulus"

import { Chart, registerables } from "chart.js";
Chart.register(...registerables);



// Connects to data-controller="dashboard"
export default class extends Controller {
  initialize() {
    console.log("Hello controller")

    // ---- dummy data for revenue made in a day ----
    const data = [10, 20, 30, 40, 50, 60, 70]
    const labels = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
    // ---- dummy data for revenue made in a day ----

    const ctx = document.getElementById('revenueChart ');

    // ---- chart ----
    // https://stackoverflow.com/questions/41280857/chart-js-failed-to-create-chart-cant-acquire-context-from-the-given-item
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'Revenue $',
          data: data,
          borderWidth: 3,
          fill: true
        }]
      },
      options: {
        plugins: { legend: {display: false} },
        scales: {
          x: { grid: {display: false} },
          y: { border: {dash: [5, 5]}, grid: {color: "d4f3ef"}, beginAtZero: true }
        }
      }
    })
    // ---- chart ----
  }
}
