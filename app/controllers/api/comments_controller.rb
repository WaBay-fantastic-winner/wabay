class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  def like
    comment = Comment.find(params[:id])
    prev_like_count = comment[:count]
    if current_user.liked_comments.include?(comment)
      # 移除讚
      current_user.liked_comments.destroy(comment)
      render json: {state: "unliked", id: params[:id]}
      comment.update(
        "count": prev_like_count - 1
      )
    else
      # 新增讚
      current_user.liked_comments << comment
      render json: {state: "liked", id: params[:id]}
      comment.update(
        "count": prev_like_count + 1
      )
    end
  end
end
