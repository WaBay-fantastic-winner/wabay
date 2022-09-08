import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['button', 'memberCenter']
  switch() {
    this.buttonTarget.classList.toggle('border-gray-300')
    this.memberCenterTarget.classList.toggle('hidden')
    }
}
