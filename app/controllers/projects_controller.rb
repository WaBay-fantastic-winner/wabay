class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def create
    # 登入後的使用者，使用多對多方式 .projects ，建立表單
    @project = current_user.projects.new(clean_params)
  
    if @project.save
       redirect_to projects_path, notic: " 提案成功 !!"
    else
      render :new 
    end
  end


  private
  def clean_params
    # 資料清洗
    clean_params = params.require(:project).permit(:organizer, :email, :phone, :project_title,:project_amount_target, :project_end_time, :project_description)
  end
end
