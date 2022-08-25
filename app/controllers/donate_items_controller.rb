class DonateItemsController < ApplicationController
  before_action :find_donate_item, only: [:edit, :update, :destroy]

  
  #贊助方案的 index 會顯示在 project 的 index 裡。
  def index
    @current_project = current_user.projects.find_by!(id: params[:project_id])
    @donate_items = @current_project.donate_items.all
  end

  def show
    @donate_item = @current_project.donate_item.find_by!(id: params[:id])
  end

  def new
    @donate_item = DonateItem.new
  end

  def create
    @current_project = current_user.projects.find_by!(id: params[:project_id])

    @donate_item = @current_project.donate_items.new(donate_item_params)

    if @donate_item.save
      redirect_to project_path(id: current_user.project_ids), notice:'贊助方案已建立，距離夢想更進一步！'
    else
      render :new
    end
  end

  def edit
    # debugger
    @current_project = current_user.projects.find_by!(id: params[:project_id])

    @donate_item = @current_project.donate_items.new(donate_item_params)
  end

  def update
    if @donate_item.update(donate_item_params)
      redirect_to project_path(id: current_user.project_ids), notice: '贊助方案已編輯。'
    else
      render :edit
    end
  end

  def destroy
    @donate_item.destroy
    # destroy 後，轉址到該專案的頁面。
    redirect_to project_page, notice: '贊助方案已刪除。'
  end

  private
  def donate_item_params
    params.require(:donate_item).permit(:title, :price, :content)
  end

  def find_donate_item
    @donate_item = current_user.projects.find_by!(id: params[:project_id]).donate_items
  end
end
