import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  connect() {
    console.log('connected to the share controller');
    console.log(this.data.get("urlValue"));
  }
}
