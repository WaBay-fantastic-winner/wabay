import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.style.display = 'none'
    },5000)
  }
}
