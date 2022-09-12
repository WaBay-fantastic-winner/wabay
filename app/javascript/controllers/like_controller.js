import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
	static targets = ["love", "count"];

	connect() {
		if (this.element.dataset.like === "true") {
			this.loveTarget.textContent = "♥";
		} else {
			this.loveTarget.textContent = "♡";
		}
	}

	like_comment() {
		const commentId = this.element.dataset.commentId;
		Rails.ajax({
			url: `/api/comments/${commentId}/like`,
			type: "post",
			success: ({ state, like_count }) => {
				console.log(Number(like_count));
				if (state === "liked") {
					this.loveTarget.textContent = "♥";
					this.countTarget.textContent = Number(like_count);
				} else {
					this.loveTarget.textContent = "♡";
					this.countTarget.textContent = Number(like_count);
				}
			},
			error: (err) => {
				console.log(err);
			},
		});
	}
}