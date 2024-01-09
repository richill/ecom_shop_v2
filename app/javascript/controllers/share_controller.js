import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["result", "name", "price"];
  connect() {
    console.log('connected to the share controller');
    console.log(this.data.get("urlValue"));
    console.log(this.resultTarget);
  }
  async share(e) {
    e.preventDefault();

    const shareData = {
      name: this.nameTarget.value,
      price: this.priceTarget.value,
      url: this.data.get("urlValue"),
    };
    console.log(shareData)
  }
}
