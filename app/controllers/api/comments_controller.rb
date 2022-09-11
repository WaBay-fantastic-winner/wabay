class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  def like
    comment = Comment.find(params[:id])
    prev_like_count = comment[:count]
    if current_user.liked_comments.include?(comment)
      # 移除讚
      current_user.liked_comments.destroy(comment)
      comment.update( #更新資料庫時機
        count: prev_like_count - 1
      )
      like_count = comment[:count] #更新完後的comment再去取得資料庫中的:count欄位資料
      render json: { state: 'unliked', id: params[:id], like_count: "#{like_count}" }
    else
      # 新增讚
      current_user.liked_comments << comment # current_user.liked_comments是一個陣列型態 所以可以用 <<
      comment.update(
        count: prev_like_count + 1
      )
      like_count = comment[:count] 
      render json: { state: 'liked', id: params[:id], like_count: "#{like_count}" } # #{like_count} 去抓20行資料
    end
  end
end