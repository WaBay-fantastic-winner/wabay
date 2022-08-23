class DonateItemsController < ApplicationController
  before_action :find_donate_item, only: [:edit, :update, :destroy]

  #贊助方案的 index 會顯示在 project 的 index 裡。
  def index
    @donate_items = DonateItem.all
  end

  def show
    @donate_item = DonateItem.find(id: params[:id])
  end

  def new
    @donate_item = DonateItem.new
  end

  def create
    @donate_item = DonateItem.new(donate_item_params)

    if @donate_item.save
      # create 成功轉址到該專案的頁面。
      redirect_to project_path(id: @donate_item.project_id), notice:'贊助方案已建立，距離夢想更進一步！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @donate_item.update(donate_item_params)
      # update 成功轉址到該專案的頁面。
      redirect_to project_path(id: @donate_item.project_id), notice: '贊助方案已編輯。'
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
    params.request(:donate_item).permit(:title, :content)
  end

  def find_donate_item
    @donate_item = DonateItem.findby!(id: params[:id])
  end
end
