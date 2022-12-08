import { Controller } from "@hotwired/stimulus"

//Connects to data-controller="filtercategories"
export default class extends Controller {
  static targets = ['subcatMusic', 'subcatTheatre']
  connect() {
    this.music = document.querySelector('[for="search_category_musique"]')
    this.theatre = document.querySelector('[for="search_category_théâtre"]')

    this.music.addEventListener("click", (event) => {
      this.toggle_music_subcat(event)
    })


    this.theatre.addEventListener("click", (event) => {
      this.toggle_theatre_subcat(event)
    })
  }

  toggle_music_subcat(event){

    this.subcatMusicTargets.forEach((item) => {
      console.log(this.music.parentElement.firstChild.checked);
      if (this.music.parentElement.firstChild.checked === false)
      {item.checked = true}
      else
      {item.checked = false}

    })
  }

  toggle_theatre_subcat(event){

    this.subcatTheatreTargets.forEach((item) => {
      console.log(this.theatre.parentElement.firstChild.checked);
      if (this.theatre.parentElement.firstChild.checked === false)
      {item.checked = true}
      else
      {item.checked = false}

    })
  }
}
