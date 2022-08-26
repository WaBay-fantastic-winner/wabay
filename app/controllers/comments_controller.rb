class CommentsController < ApplicationController
  before_action :authenticate_user!  # 新增、刪除留言都要先有登入
  before_action :find_project, only: [:create]
  def create
    @comment = @project.comments.new(clean_params) # 從提案的角度來新增留言
    @comment.user = current_user #
    if @comment.save
      redirect_to project_path(@project), notice: "留言成功"
    else
      redirect_to project_path(@project), notice: "留言失敗"
    end
  end

  private
  def clean_params
    params.require(:comment).permit(:content)
  end
  def find_project #找到該提案下方建立留言
    @project = Project.find_by(params[:article_id])
  end
end
