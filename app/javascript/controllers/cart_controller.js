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

  clear() {
    localStorage.removeItem("cart")
    window.location.reload()
  }

  removeFromCart(event) {
    // get cart from the local storage
    const cart = JSON.parse(localStorage.getItem("cart"))
    const values = JSON.parse(event.target.value)
    const {id, size} = values
    const index = cart.findIndex(item => item.id === id && item.size === size)
    if (index >= 0) {
      cart.splice(index, 1)
    }
    localStorage.setItem("cart", JSON.stringify(cart))
    window.location.reload()
  }

  checkout() {
    console.log("---checkout---")
    // get cart from the local storage
    const cart = JSON.parse(localStorage.getItem("cart"))
    const payload = {
      authenticity_token: "",
      cart: cart
    }

    // ---- fetch ----
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch("/checkout", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token":  csrfToken,
      },
      body: JSON.stringify(payload)
    }).then(response => {
      if (response.ok) {
        window.location.href = body.url
      } else {
        const errorEl =  document.createElement("div ")
        errorEl.innerText = `There was an error processing your order. ${body.error }`
        let errorContainer = document.getElementById("errorContainer")
        errorContainer.appendChild((errorEl))
      }
    })
    // ---- fetch ----
  }

}
