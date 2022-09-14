class Api::SearchesController < ApplicationController
  def projects
    keyword = params[:keyword]
    type = params[:type]

    @projects = Project.all.joins(:avatar_attachment)
    if keyword   # 關鍵字搜尋
      @projects = Project.where("title like ?","%#{keyword}%")
    elsif type  # 類別搜尋
      if type == "desc" # 新到舊
        @projects = @projects.order(created_at: :desc)
      elsif type == "asc" # 舊到新
        @projects = @projects.order(created_at: :asc)
      else # 熱門
        @projects = Project.includes(:donate_items).order('donate_items.count desc')
      end
    end
    render json: @projects.map { |user| 
      img = {img: url_for(user.avatar)}
      user.as_json.merge(img)
    }
  end
end