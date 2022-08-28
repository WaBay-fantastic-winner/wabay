class TransactionsController < ApplicationController
  require 'uri'
  require 'openssl'
  require 'CGI'

  # def show
  # end
  
  def create
    # for ecpay action
    @MerchantTradeNo = @serial
    @MerchantTradeDate = Time.now.strftime("%d/%m/%Y %H:%M")
    @ItemName = params["donate_item"]["title"]
    @TotalAmount = params["donate_item"]["price"]

    # 建立交易紀錄（訂單）
    @transaction = Transaction.new

    # 給 user_id
    @transaction.user_id = current_user.id

    # 給 donate_item_id
    current_project = current_user.projects.find(params["donate_item"]["project_id"])
    current_donate_item = DonateItem.find_by!(project_id: current_project, title: params["donate_item"]["title"])
    @transaction.donate_item_id = current_donate_item.id

    # debugger
    if @transaction.save
      redirect_to ecpay_transactions_path, notice:'此筆交易已成立，請填寫交易資料：'
    else
      render :save_error
    end
  end

  def ecpay
    params = {
      "TradeDesc": "專案贊助交易", 
      "PaymentType": "aio", 
      "MerchantTradeDate": @MerchantTradeDate, 
      "MerchantTradeNo": @MerchantTradeNo, 
      "MerchantID": 3002607, 
      "ReturnURL": "https://f25a-103-3-192-33.jp.ngrok.io/payment/returnpage",
      "ItemName": "Apple iphone 7 手機殼", 
      "TotalAmount": 1000, 
      "ChoosePayment": "ALL", 
      "IgnorePayment": "WebATM#ATM#CVS#BARCODE",
      "EncryptType": 1
    }

    # 1.由A到Z的順序並轉換為 query string
    order_query_string = URI.encode_www_form(params.to_a.sort!)
    # 2.前後加 Key 跟 IV
    key_vi = "HashKey=pwFHCqoQZGmho4w6&" + order_query_string + "&HashIV=EkRm7iFT261dpevs"
    # 3.進行 URL encode 並轉小寫
    url_encode = (CGI.escape key_vi).downcase.gsub!(/%25/, '%').gsub!(/%2b/, '+')
    # 4.sha256加密轉大寫
    def sha256_encode(trade_info)
      encode_string = trade_info
      Digest::SHA256.hexdigest(encode_string).upcase
    end 
    p sha256_encode(d)
  end

  
  def destroy
    redirect_to donate_items_path, notice: '此筆交易已刪除...'
  end
  
  private

  def donate_item_form_post_params
    params.require(:donate_item).permit(:title, :price)
  end
  
  def find_transaction
    @transaction = Transaction.find_by(id: params[:id])
  end
end
