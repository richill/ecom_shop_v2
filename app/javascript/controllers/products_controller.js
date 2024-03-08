import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products"
export default class extends Controller {
  static values = { size: String, product: Object }

  addToCart() {
    console.log("product: ", this.productValue)
  }

  selectColour(e) {
    this.colourValue = e.target.value
    const selectedColourEl = document.getElementById("selected-colour")
    selectedColourEl.innerText = `Selected Colour: ${this.colourValue}`
  }
}
