class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:search]
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
    find_project
    if is_current_user_project?
      @project.destroy
      redirect_to '/projects', notice: '提案刪除成功 !!'
    else
      redirect_to '/projects', notice: '不能刪除 !!'
    end  

  end

  def show
    find_project
  end

  def update
    find_project
    if is_current_user_project?
      if @project.update(clean_params)
        redirect_to project_path, notice: ' 提案更新成功 !!'
      else
        render :edit
      end
    end  


    # if is_current_user_project?
    #   if @project.update(clean_params)
  # end 

    # redirect_to project_path, notice: ' 提案更新失敗 !!'
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
    # render html: params
    @project = Project.where("project_title like?", "%#{keyword}%")
    respond_to do |format|
      format.json { render json => @project }
      format.html { render :search }
      # format.jsx { render => HomePage }
    end
  end

  private

  def is_current_user_project?
    @project.user_id == current_user.id
  end

  def clean_params
    # 資料清洗
    clean_params = params.require(:project).permit(:organizer, :email, :phone, :project_title, :project_amount_target,
                                                    :project_end_time, :project_description)
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end

  def week_hot
    #金額多的就是本週熱門
    @week_hot = Project.where.maximum
    @week_hot.order(project_amount_target: :desc)
    respond_to do |format|
      format.json { render json => @week_hot }
    end
  end

  def recently_launched
    #抓出建立時間一週內的project
    @recently_launched = Project.where( "created_at > ? and created_at <= ?", Time.now.beginning_of_week, Time.now.end_of_week )
    @recently_launched.order(created_at: :desc)
    # render html: params
    respond_to do |format|
      format.json { render json => @recently_launched }
    end
  end

  def recently_ending
    #抓出結束（倒數）時間一週內的project
    @recently_ending = Project.where( "project_end_time > ? and project_end_time <= ?", Time.now.beginning_of_week, Time.now.end_of_week )
    @recently_ending.order(project_end_time: :desc)
    respond_to do |format|
      format.json { render json => @recently_ending }
    end
  end

  def all_project
    #全部
    @all_project = Project.all
    respond_to do |format|
      format.json { render json => @all_projectl }
    end
  end
end
