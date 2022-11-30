import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark"
export default class extends Controller {
  removeBookmark(event) {
    console.log("remove bookmark");
  }

  addBookmark(event) {
    fetch(`/events/${event.target.id}/bookmarks`, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData()
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
    })
  }

}
