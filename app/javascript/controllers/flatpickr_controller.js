import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      // more options available on the documentation!
      minDate: "today",
      mode: "multiple"
    });
  }
}
