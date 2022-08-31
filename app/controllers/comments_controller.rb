# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user! # 新增、刪除留言都要先有登入
  before_action :find_project, only: [:create]
  before_action :find_comment, only: [:destroy]
  def create
    @comment = @project.comments.new(clean_params) # 從提案的角度來新增留言
    @comment.user = current_user # has_many的關聯
    if @comment.save
      redirect_to project_path(@project), notice: '留言成功'
    else
      redirect_to project_path(@project), notice: '留言失敗'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.project, notice: '留言刪除成功'
  end

  private

  def clean_params
    params.require(:comment).permit(:content)
  end

  # 找到該提案下方建立留言
  def find_project
    @project = Project.find_by(id: params[:project_id])
  end

  # 找到該提案下方建立留言
  def find_comment
    @comment = current_user.comments.find(params[:id])
  end
end
