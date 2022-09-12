class Api::SearchesController < ApplicationController
  def projects
    keyword = params[:keyword]
    type = params[:type]
    @projects = Project.all
    if keyword   # 關鍵字搜尋
      @projects = Project.where("project_title like ?","%#{keyword}%")
    elsif type  # 類別搜尋
      if type == "desc" # 新到舊
        @projects = @projects.order(created_at: :desc)
      elsif type == "asc" # 舊到新
        @projects = @projects.order(created_at: :asc)
      else # 熱門
        @projects = Project.includes(:donate_items).order('donate_items.count desc')
      end
    end
    render json: @projects
  end
end