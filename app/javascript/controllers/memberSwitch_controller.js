import { Controller } from "stimulus"

export default class extends Controller {
  switch() {
    this.element.classList.toggle('border-gray-300')
    document.getElementById('memberCenter').classList.toggle('hidden')
    }
}
