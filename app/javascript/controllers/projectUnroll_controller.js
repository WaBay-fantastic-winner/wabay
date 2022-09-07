import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "unrollBtn", "projectContent"];

  unroll () {
    let cover = document.querySelector('.translucent-cover');
    this.unrollBtnTarget.classList.add("hidden");
    this.projectContentTarget.classList.remove("h-72");
    cover.classList.add("hidden")
  }
}
