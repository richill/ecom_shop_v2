import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products"
export default class extends Controller {
  static values = { size: String, product: Object }

  addToCart() {
    console.log("product: ", this.productValue);

    const cart = localStorage.getItem("cart");
    if (cart) {

    } else {
      const cartArray = []
      cartArray.push({
        id: this.productValue.id,
        name: this.productValue.name,
        price: this.productValue.price,
        colour: this.colourValue,
        quantity: 1
      })
    }
  }

  selectColour(e) {
    this.colourValue = e.target.value
    const selectedColourEl = document.getElementById("selected-colour")
    selectedColourEl.innerText = `Selected Colour: ${this.colourValue}`
  }
}
