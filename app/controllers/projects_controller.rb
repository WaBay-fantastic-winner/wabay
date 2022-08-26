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
    @projects = Project.where("title like?" or "author like?", "%#{keyword}%", "%#{keyword}%")
    respond_to do |format|
      format.json { render json: @project }
      # format.html { render :index }
    end
  end

  private

  def clean_params
    # 資料清洗
    clean_params = params.require(:project).permit(:organizer, :email, :phone, :project_title, :project_amount_target,
                                                   :project_end_time, :project_description)
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end
end
