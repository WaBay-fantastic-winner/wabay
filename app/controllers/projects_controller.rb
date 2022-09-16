# frozen_string_literal: true

require 'pry'
class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :find_project, only: %i[show edit destroy update]
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

  def edit; end

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

    @donate_items = @project.donate_items.order(created_at: :asc)

    @donate_users_count = Transaction.where(project_id: @project.id).select(:user_id).map(&:user_id).uniq.count

    @follow_state = if follow_list.empty?
                      '追蹤專案'
                    else
                      '取消追蹤'
                    end

    project_current_total(params[:id])
    percentage_of_currency
  end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: ' 提案更新成功 !!'
    else
      render :edit
    end
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_path, notice: ' 提案成功 !!'
    else
      render :new
    end
  end

  def follow
    find_project

    if follow_list.empty?
      add_follow
    else
      cancel_follow
    end
  end

  private

  def project_params
    params.require(:project).permit(:organizer, :email, :phone, :title, :amount_target, :end_time, :description,
                                    :avatar)
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def follow_list
    Follow.current_user_follow_this_project(current_user&.id, params)
  end

  def add_follow
    @project.follows.create(:user_id => current_user.id, :mail_sent => "false")
    render json: {status: "been_followed"}
  end

  def cancel_follow
    follow_list.first.destroy
    render json: { status: 'cancel_follow' }
  end

  def to_project_show(notice)
    redirect_to project_path(id: params[:id]), notice:
  end
end