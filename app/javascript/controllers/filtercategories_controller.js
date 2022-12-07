// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="filtercategories"
// export default class extends Controller {
//   static targets = ['subcatMusic', 'subcatTheatre']
//   connect() {
//     this.music = document.querySelector('[for="search_category_musique"]')

//     this.music.addEventListener("click", (event) => {
//       this.toggle_music_subcat(event)
//     })

//     this.theatre = document.querySelector('[for="search_category_theatre"]')

//     this.theatre.addEventListener("click", (event) => {
//       this.toggle_theatre_subcat(event)
//     })
//   }
//   toggle_music_subcat(event){

//     console.log(this.music.style);

//     console.log("action check all music")
//     console.log(this.subcatMusicTargets);
//     this.subcatMusicTargets.forEach((item) => {
//       item.checked = true
//     })
//   }

//   toggle_theatre_subcat(event){
//     console.log("action check all")

//     this.subcatTheatreTargets.forEach((item) => {
//       item.checked = true
//     })
//   }
// }
