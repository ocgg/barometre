import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {

    flatpickr("#event_date", {
      enableTime: false,
      dateFormat: "Y-m-d",
      minDate: "today",
      mode: "multiple",
      // plugins: [new confirmDatePlugin({})]
    });

    flatpickr("#event_hour", {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
    });
  }

}
