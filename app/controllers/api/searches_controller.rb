# frozen_string_literal: true

module Api
  class SearchesController < ApplicationController
    def projects
      keyword = params[:keyword]
      type = params[:type]
      @projects = Project.all
      if keyword # 關鍵字搜尋
        @projects = Project.where('title like ?', "%#{keyword}%")
      elsif type # 類別搜尋
        @projects = case type
                    when 'desc' # 新到舊
                      @projects.order(created_at: :desc)
                    when 'asc' # 舊到新
                      @projects.order(created_at: :asc)
                    else # 熱門
                      Project.includes(:donate_items).order('donate_items.count desc')
                    end
      end
      render json: @projects
    end
  end
end
