class DonateItemsController < ApplicationController
  before_action :current_project, only: %i[index show create update destroy]
  before_action :find_donate_item, only: %i[show edit update destroy]

  # 贊助方案的 index 會顯示在 project 的 show 裡。 一個專案畫面(show)有很多個贊助項目(index)
  def index
    @donate_items = @current_project.donate_items.all
  end

  def show
  end

  def new
    @donate_item = DonateItem.new
  end

  def create
    current_project

    @donate_item = @current_project.donate_items.new(donate_item_params)

    if @donate_item.save
      back_to_project_page '贊助方案已建立，距離夢想更進一步！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @donate_item.update(donate_item_params)
      back_to_project_page '贊助方案已編輯。'
    else
      render :edit
    end
  end

  def destroy
    @donate_item.destroy
    back_to_project_page '贊助方案已刪除。'
  end

  private

  def donate_item_params
    params.require(:donate_item).permit(:title, :price, :content)
  end

  def current_project
    @current_project = Project.find_by!(id: params[:project_id])
  end

  def find_donate_item
    current_project
    @donate_item = @current_project.donate_items.find_by!(id: params[:id])
  end

  def back_to_project_page(notice_sentence)
    redirect_to project_path(id: params[:project_id]), notice: notice_sentence
  end
end
