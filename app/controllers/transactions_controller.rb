class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @transactions = Transaction.all
  end
  
  def create
    # 建立交易紀錄（訂單）
    @transaction = Transaction.new(user_id: current_user.id,
                                   project_id: params[:donate_item][:project_id], 
                                   donate_item_id: donate_item_id, 
                                   price: price)

    if @transaction.save
      # for ecpay action
      produce_ecpay_basic_params
      # 交易訂單成功寫入後，呼叫 Service 將完整參數包好。
      @ecpay_params = Payment::EcpayRequest.new(@merchant_trade_date,       
                                                @merchant_trade_no, 
                                                @item_name, 
                                                @total_amount
                                               ).perform
    else
      render :save_error
    end
  end

  def paid
    @transaction = Transaction.find_by!(serial: params[:MerchantTradeNo])
    @transaction.pay!
    # 登入者在付款完成跳轉到專案頁面後會被踢出，導致無法打到 paid action。
  end

  def destroy
    @transaction = Transaction.find_by!(id: params[:id])
    @transaction.update(deleted_at: Time.now)
    redirect_to transactions_path, notice: '此筆交易已刪除...' 
  end

  private

  def donate_item_id
    current_project = Project.find(params["donate_item"]["project_id"])
    current_donate_item = DonateItem.find_by!(project_id: current_project, title: params["donate_item"]["title"]).id
  end

  def price
    params["donate_item"]["price"]
  end

  def produce_ecpay_basic_params
    @merchant_trade_no = @transaction.serial
    @merchant_trade_date = Time.now.strftime("%Y/%m/%d %H:%M:%S")
    @item_name = params["donate_item"]["title"]
    @total_amount = params["donate_item"]["price"]
  end
end