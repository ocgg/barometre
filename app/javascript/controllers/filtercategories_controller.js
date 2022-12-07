import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtercategories"
export default class extends Controller {
  connect() {
    console.log("Hello")
  }
}
