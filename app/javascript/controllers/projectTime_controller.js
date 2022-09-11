import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    // 假設從dataset取得的時間是2022-09-10 00:00:00 UTC 
    // 因不想有秒數和UTC所以取前面16個index => 2022-09-10 00:00
    const createdTime = this.element.dataset.createdTime.slice(0, 16)
    const endTime = this.element.dataset.endTime.slice(0, 16)
    this.element.innerHTML = `贊助時間： ${createdTime} ~ ${endTime}`
  }
}