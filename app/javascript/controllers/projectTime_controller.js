import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    // 假設從dataset取得的時間2022-09-10 00:00:00 UTC 因不想有秒數和UTC所以用取前面16index
    const createdTime = this.element.dataset.createdTime.slice(0, 16)
    const endTime = this.element.dataset.endTime.slice(0, 16)
    this.element.innerHTML = `贊助時間： ${createdTime} ~ ${endTime}`
  }
}