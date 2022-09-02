import { Controller } from "stimulus"
import log from "tailwindcss/lib/util/log";
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["love","count"]

  connect(){
    // console.log(this.element.dataset)
    if (this.element.dataset.like === "true") {
      this.loveTarget.textContent = "♥"
    } else {
      this.loveTarget.textContent = "♡"
    }
  }

  like_comment() {
    const commentId = this.element.dataset.commentId
    Rails.ajax({
      url: `/api/comments/${commentId}/like`,
      type: "post",
      success: ({ state }) => {
        // console.log(state)
        if (state === "liked") {
          this.loveTarget.textContent = "♥"
          this.countTarget.textContent = Number(this.element.dataset.commentCount) + 1
        } else {
          this.loveTarget.textContent = "♡"
          this.countTarget.textContent = Number(this.element.dataset.commentCount) - 1
        }
      },
      error: (err) => {
        console.log(err)
      }
    })

  }
}
