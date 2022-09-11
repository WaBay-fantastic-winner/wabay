class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: %i[paid]

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
      project_current_total(params["donate_item"]["project_id"])
      find_project
      @project.update(current_total: @sum)

      notify_achievement_to_followers(@project.title)

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
    puts params
    transaction = Transaction.find_by!(serial: params[:MerchantTradeNo])
    transaction.pay!
    sign_in(User.find(transaction.user_id))
    redirect_to project_path(transaction.project_id)
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
    DonateItem.where(project_id: params["donate_item"]["project_id"], title: params["donate_item"]["title"]).first.price
  end

  def find_project
    @project = Project.find(params["donate_item"]["project_id"])
  end

  def produce_ecpay_basic_params
    @merchant_trade_no = @transaction.serial
    @merchant_trade_date = Time.now.strftime("%Y/%m/%d %H:%M:%S")
    @item_name = params["donate_item"]["title"]
    @total_amount = price
  end

  def notify_achievement_to_followers(project)
    if percentage_of_currency >= 100
      MailWorkerJob.perform_later(project)
    end
  end
end