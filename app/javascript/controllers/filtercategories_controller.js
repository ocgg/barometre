import { Controller } from "@hotwired/stimulus"

//Connects to data-controller="filtercategories"
export default class extends Controller {
  static targets = ['subcatMusic', 'subcatTheatre']
  connect() {
    console.log('coucou');
    this.music = document.querySelector('[for="search_category_musique"]')
    this.theatre = document.querySelector('[for="search_category_theatre"]')

    this.music.addEventListener("click", (event) => {
      this.toggle_music_subcat(event)
      console.log(event)
    })


    this.theatre.addEventListener("click", (event) => {
      this.toggle_theatre_subcat(event)
    })
  }

  toggle_music_subcat(event){

    this.subcatMusicTargets.forEach((item) => {
      if (this.music.path[11].document.activeElement.attributes.checked === true)
      {item.checked = true}
      else {item.checked = false}

    })
  }

  toggle_theatre_subcat(event){
    console.log("action check all")

    this.subcatTheatreTargets.forEach((item) => {
      item.checked = true
    })
  }
}
