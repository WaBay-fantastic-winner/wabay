<<<<<<< HEAD
# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def destroy
    find_project.destroy
    redirect_to '/projects', notice: '提案刪除成功 !!'
  end

  def show
    find_project

    # 在 projects 的 show 頁面，有 donate_items 的 index
    current_project
    @donate_items = current_project.donate_items.all
  end

  def update
    if find_project.update(clean_params)
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

  def search
    keyword = params[:keyword]
    #render只是查看資料
    render json: keyword
    @projects = Project.where("title like?", "%#{keyword}%")
    respond_to do |format|
      format.json { render json: @project }
      # format.html { render :index }
    end
  end

  private

  def clean_params
    # 資料清洗
    params.require(:project).permit(:organizer, :email, :phone, :project_title, :project_amount_target,
                                    :project_end_time, :project_description)
  end

  # def find_project
  #   @project = Project.find_by(id: params[:id])
  # end

  def week_hot
    #金額多的就是本週熱門
    @week_hot = Project.where("project_amount_target.maximum") #
    respond_to do |format|
      format.json { render json: @week_hot }
    end
  end

  def recently_launched
    #抓出建立時間一週內的project
    @recently_launched = Project.where("created_at" <= Time.now + 1.week)
    respond_to do |format|
      format.json { render json: @recently_launched }
    end
  end

  def recently_ending
    #抓出結束（倒數）時間一週內的project
    @recently_ending = Project.where("project_end_time" >= Time.now + 1.week)
    respond_to do |format|
      format.json { render json: @recently_ending }
    end
  end

  def all_project
    #全部
    @project_all = Project.all
    respond_to do |format|
      format.json { render json: @project_all }
    end
  end

  def current_project
    @current_project = current_user.projects.find_by!(id: params[:id])
  end
end
=======
# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    find_project
  end

  def destroy
    find_project.destroy
    redirect_to '/projects', notice: '提案刪除成功 !!'
  end

  def show
    find_project
    @comment = Comment.new
    @comments = @project.comments.order(id: :desc)
  end

  def update
    if find_project.update(clean_params)
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
    params.require(:project).permit(:organizer, :email, :phone, :project_title, :project_amount_target,
                                    :project_end_time, :project_description)
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end
end
>>>>>>> origin/feature/comment
