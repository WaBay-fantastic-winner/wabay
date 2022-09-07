import { Controller } from "stimulus"

export default class extends Controller {
    connect() {
    const changeProgress = (progress) => {
        this.element.style.width = `${progress}%`;
        this.element.previousSibling.previousSibling.innerHTML = `${progress}%`;
    };
    setTimeout(() => changeProgress(22), 1000);
    setTimeout(() => changeProgress(45), 2000);
    setTimeout(() => changeProgress(85), 4600);
    setTimeout(() => changeProgress(98), 5266);
    setTimeout(() => changeProgress(100), 8000);
    }
}
