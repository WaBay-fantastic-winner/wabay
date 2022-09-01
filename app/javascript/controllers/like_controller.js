import { Controller } from "stimulus"
import log from "tailwindcss/lib/util/log";
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["love"]

  connect(){
    console.log(123);
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
        console.log(state);
        if (state === "liked") {
          this.loveTarget.textContent = "♥"
        } else {
          this.loveTarget.textContent = "♡"
        }
      },
      error: (err) => {
        console.log(err)
      }
    })

  }
}

// <%= link_to "♡", like_api_comment_path(comment), method: "post" %> 