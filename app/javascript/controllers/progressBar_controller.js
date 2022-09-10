import { Controller } from "stimulus"

export default class extends Controller {
    connect() {
    const percentage = this.element.dataset.percentage
    const changeProgress = (progress) => {
        this.element.style.width = `${progress}%`;
        this.element.previousSibling.previousSibling.innerHTML = `${progress}%`;
    };
    changeProgress(percentage);
    }
}
