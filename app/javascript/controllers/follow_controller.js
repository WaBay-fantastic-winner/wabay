import { Controller } from "stimulus";
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "followButton" ]

  connect(){
  }

  followUp(){
    const projectID = this.element.dataset.projectId

    Rails.ajax({
      url: `/projects/${projectID}/follow`,
      type: 'post',
      success: ({ status }) => {
        if (status === "been_followed"){
          this.followButtonTarget.textContent = "取消追蹤"
        } else {
          this.followButtonTarget.textContent = "追蹤專案"
        }
      },
      error: (err) => {
        console.log(err)
      }
    })
  }
}