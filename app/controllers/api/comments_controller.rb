class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  def like
    comment = Comment.find(params[:id])
    prev_like_count = comment[:count]
    if current_user.liked_comments.include?(comment)
      # 移除讚
      current_user.liked_comments.destroy(comment)
      comment.update(
        count: prev_like_count - 1
      )
      like_count = Comment.find(params[:id])[:count]
      render json: { state: 'unliked', id: params[:id], like_count: "#{like_count}" }
    else
      # 新增讚
      current_user.liked_comments << comment
      comment.update(
        count: prev_like_count + 1
      )
      like_count = Comment.find(params[:id])[:count]
      render json: { state: 'liked', id: params[:id], like_count: "#{like_count}" }
    end
  end

  def like_count
    like_count = Comment.find(params[:id])[:count]
    render json: { like_count: "#{like_count}" }
  end
end
