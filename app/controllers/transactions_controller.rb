class TransactionsController < ApplicationController
  before_action :create_serial
  skip_before_action :verify_authenticity_token

  def create_serial
    time = Time.now.strftime('%d%m%Y%H%M%S').split('').uniq.sample(3)
    words = ("a".."z").to_a.sample(3)
    @serial = (time + words).join
  end
  
  def create
    # for ecpay action
    @MerchantTradeNo = @serial
    @MerchantTradeDate = Time.now.strftime("%Y/%m/%d %H:%M:%S")
    @ItemName = params["donate_item"]["title"]
    @TotalAmount = params["donate_item"]["price"]

    # 建立交易紀錄（訂單）
    @transaction = Transaction.new
    
    ## 給 user_id
    @transaction.user_id = current_user.id
    
    ## 給 donate_item_id
    current_project = current_user.projects.find(params["donate_item"]["project_id"])
    current_donate_item = DonateItem.find_by!(project_id: current_project, title: params["donate_item"]["title"])
    @transaction.donate_item_id = current_donate_item.id
    
    @transaction.serial = @serial
    @transaction.price = params["donate_item"]["price"]
    
    if @transaction.save
      # 交易訂單成功寫入後，呼叫 Service 將完整參數包好。
      @ecpay_params = Payment::EcpayRequest.new(@MerchantTradeNo, @MerchantTradeDate, @ItemName, @TotalAmount).perform
    else
      render :save_error
    end
  end

  def paid
    @transaction.pay  #尚未，須先解決交易完成，跳轉到專案後登入者被踢出的問題。
  end

  def destroy
    redirect_to donate_items_path, notice: '此筆交易已刪除...' #尚未
  end
  
  private
  
  def donate_item_form_post_params
    params.require(:donate_item).permit(:title, :price)
  end
  
  def find_transaction
    @transaction = Transaction.find_by(id: params[:id])
  end
end
