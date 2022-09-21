import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["unrollBtn", "projectContent", "translucentCover"];

  unroll () {
    this.unrollBtnTarget.classList.add("hidden");
    this.projectContentTarget.classList.remove("h-64");
    this.translucentCoverTarget.classList.add("hidden")
  }
}
