class DonateItemsController < ApplicationController
  # before_action :find_donate_item, only: [:edit, :update, :destroy]
  before_action :current_project, only: %i[index show create update destroy]

  # 贊助方案的 index 會顯示在 project 的 show 裡。 一個專案畫面(show)有很多個贊助項目(index)
  def index
    @donate_items = @current_project.donate_items.all
  end

  def show
    find_donate_item
  end

  def new
    @donate_item = DonateItem.new
  end

  def create
    current_project

    @donate_item = @current_project.donate_items.new(donate_item_params)

    if @donate_item.save
      redirect_to project_path(id: params[:project_id]), notice: '贊助方案已建立，距離夢想更進一步！'
    else
      render :new
    end
  end

  def edit
    find_donate_item
  end

  def update
    find_donate_item

    if @donate_item.update(donate_item_params)
      redirect_to project_path(id: params[:project_id]), notice: '贊助方案已編輯。'
    else
      render :edit
    end
  end

  def destroy
    find_donate_item
    @donate_item.destroy
    redirect_to project_path(id: params[:project_id]), notice: '贊助方案已刪除。'
  end

  private

  def donate_item_params
    params.require(:donate_item).permit(:title, :price, :content)
  end

  def current_project
    @current_project = current_user.projects.find_by!(id: params[:project_id])
  end

  def find_donate_item
    current_project
    @donate_item = @current_project.donate_items.find_by!(id: params[:id])
  end
end
