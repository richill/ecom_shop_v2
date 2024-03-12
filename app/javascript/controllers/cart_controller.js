import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  initialize() {
    console.log("connected to the cart controller")

    const cart = JSON.parse(localStorage.getItem( "cart"));

    // if there is no cart we do not anything therefore we place return here
    if (!cart) { return }

    // loop over all the items in the cart and sum-up their prices
    let total = 0
    for (let i=0; i < cart.length; i++) {
      const item = cart[i]
      total += item.price * item.quantity
      const div = document.createElement("div")
      div.classList.add("mt-2")
      div.innerText = `Item: ${item.name} - $${item.price/100.0} - Colour: ${item.colour} - Quantity: ${item.quantity}`

      //button to remove items for the cart
      const deleteButton = document.createElement("button")
      deleteButton.innerText = "Remove"
      console.log("item.id: ", item.id)
      deleteButton.value = JSON.stringify({id: item.id, colour: item.colour})
      deleteButton.classList.add("rounded", "text-white", "px-2", "py-1", "ml-2")

      // removes individual item from cart
      deleteButton.addEventListener("click", this.removeFromCart)
      div.appendChild(deleteButton)
      this.element.prepend(div)
    }

    const totalEl = document.createElement("div")
    totalEl.innerText = `Total: $${total/100.0}`
    let totalContainer = document.getElementById("total")
    totalContainer.appendChild(totalEl)
  }
}
