# frozen_string_literal: true
class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :destroy, :update]
  def index
    @projects = Project.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @projects }
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def destroy
    if @project.really_destroy!
      redirect_to '/projects', notice: '提案刪除成功 !!'
    else
      redirect_to '/projects', notice: '不能刪除 !!'
    end
  end

  def show
    @comment = Comment.new
    @comments = @project.comments.order(id: :desc)
    
    # 在 projects 的 show 頁面，有 donate_items 的 index
    @donate_items = @project.donate_items.all

    project_current_total(params[:id])
    percentage_of_currency
  end

  def update
    if @project.update(clean_params)
      redirect_to project_path, notice: ' 提案更新成功 !!'
    else
      render :edit
    end
  end

  def create
    # 登入後的使用者，使用多對多方式 .projects ，建立表單
    @project = current_user.projects.new(clean_params)
    if @project.save
      redirect_to projects_path, notice: ' 提案成功 !!'
    else
      render :new
    end
  end

  private

  def clean_params
    # 資料清洗
    params.require(:project).permit(:organizer, :email, :phone, :title, :amount_target, :end_time, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end