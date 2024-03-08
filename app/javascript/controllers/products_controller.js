import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products"
export default class extends Controller {
  static values = { colour: String, product: Object }

  addToCart() {
    console.log("product: ", this.productValue)
    const cart = localStorage.getItem("cart")
    if (cart) {
      const cartArray = JSON.parse(cart)
      const foundIndex = cartArray.findIndex(item => item.id === this.productValue.id && item.colour === this.colourValue)
      if (foundIndex >= 0) {
        cartArray[foundIndex].quantity = parseInt(cartArray[foundIndex].quantity) + 1
      } else {
        cartArray.push({
          id: this.productValue.id,
          name: this.productValue.name,
          price: this.productValue.price,
          colour: this.colourValue,
          quantity: 1
        })
      }
      localStorage.setItem("cart", JSON.stringify(cartArray))
    } else {
      const cartArray = []
      cartArray.push({
        id: this.productValue.id,
        name: this.productValue.name,
        price: this.productValue.price,
        colour: this.colourValue,
        quantity: 1
      })
      localStorage.setItem("cart", JSON.stringify(cartArray))
    }
  }

  selectColour(e) {
    this.colourValue = e.target.value
    const selectedColourEl = document.getElementById("selected-colour")
    selectedColourEl.innerText = `Selected Colour: ${this.colourValue}`
  }
}
