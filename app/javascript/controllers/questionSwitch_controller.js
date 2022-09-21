import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["btn"];

    switch (e) {
    this.btnTargets[e.currentTarget.dataset.index].classList.toggle('active')
    }
}