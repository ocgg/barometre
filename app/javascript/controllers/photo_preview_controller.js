import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  static targets = ['input', 'label']

  connect() {

  }

  async display() {
    // convert file to base64 url
    const readURL = file => {
      return new Promise((res, rej) => {
        const reader = new FileReader();
        reader.onload = e => res(e.target.result);
        reader.onerror = e => rej(e);
        reader.readAsDataURL(file);
      });
    };

    const file = this.inputTarget.files[0];
    const url = await readURL(file);

    const img = document.createElement('img');
    img.classList.add('image-event-show');
    img.src = url;

    this.labelTarget.replaceChildren(img, 'Choisir une autre image...');
  }
