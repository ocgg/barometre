import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fav-icon"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
  
}
