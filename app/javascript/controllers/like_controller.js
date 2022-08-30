import { Controller } from "stimulus"
import log from "tailwindcss/lib/util/log";
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["love"]
  like_comment() {
    const commentId = this.element.dataset.commentId

    Rails.ajax({
      url: `/api/comments/${commentId}/like`,
      type: "post",
      success: ({ state }) => {
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