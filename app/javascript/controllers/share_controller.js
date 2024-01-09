import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["result"]
  connect() {
    console.log('connected to the share controller');
    console.log(this.data.get("urlValue"));
    console.log(this.data.resultTarget);
  }
}
