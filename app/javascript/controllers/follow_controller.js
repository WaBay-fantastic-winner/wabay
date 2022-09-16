import { Controller } from "stimulus";
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "followButton" ]

  followUp(){
    const projectID = this.element.dataset.projectId
    
    Rails.ajax({
      url: `/projects/${projectID}/follow`,
      type: 'post',
      success: ({ status }) => {
        if (status === "been_followed"){
          this.followButtonTarget.textContent = "取消追蹤"
          this.followButtonTarget.classList.add("bg-purple-400","text-white")
        } else {
          this.followButtonTarget.textContent = "追蹤專案"
          this.followButtonTarget.classList.remove("bg-purple-400","text-white")
        }
      },
      error: (err) => {
        alert(err)
      }
    })
  }

  cancelFollow(){
    const projectID = this.element.dataset.projectId

    Rails.ajax({
      url: `/projects/${projectID}/follow`,
      type: 'post',
      success: () => {
        location.reload()
      },
      error: (err) => {
        alert(err)
      }
    })
  }
}