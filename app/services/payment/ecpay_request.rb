module Payment
  class EcpayRequest
    require 'uri'
    require 'openssl'
    require 'CGI'
    require 'net/http'

    def initialize(merchant_trade_date,
                   merchant_trade_no,
                   title, 
                   price)
  
      @basic_params = {
        "MerchantID": 3002607, 
        "TradeDesc": "專案贊助交易", 
        "PaymentType": "aio", 
        "MerchantTradeDate": merchant_trade_date, 
        "MerchantTradeNo": merchant_trade_no, 
        "ReturnURL": "https://f3ec-103-3-192-33.jp.ngrok.io/transactions",
        "ItemName": title,
        "TotalAmount": price, 
        "ChoosePayment": "ALL", 
        "IgnorePayment": "WebATM#ATM#CVS#BARCODE",
        "EncryptType": 1,
        "OrderResultURL": "https://f3ec-103-3-192-33.jp.ngrok.io/transactions/paid",
      }
      # 增加參數欄位，記得要到 transactions/create.html.erb 增加欄位！
    end
  
    def perform
      create_check_mac_value(@basic_params)
    end
  
    private
  
    def create_check_mac_value(params)
      # 1.由A到Z的順序並轉換為 query string
      order_query_string = URI.encode_www_form(params.to_a.sort!)
      # 2.前後加 Key 跟 IV
      key_vi = "HashKey=pwFHCqoQZGmho4w6&" + order_query_string + "&HashIV=EkRm7iFT261dpevs"
      # 3.進行 URL encode 並轉小寫
      url_encode = (CGI.escape key_vi).downcase.gsub!(/%25/, '%').gsub!(/%2b/, '+')
      # 4.sha256加密轉大寫
      encrypted_result = Digest::SHA256.hexdigest(url_encode).upcase
      # 5. 把 check_mac_value 的 key, value 加入參數 hash 內
      entire_params(encrypted_result)
    end
  
    def entire_params(check_mac_value)
      check_params = {"CheckMacValue": "#{check_mac_value}"}
      data = @basic_params.merge!(check_params).stringify_keys
    end

    # 官方測試信用卡好
    4311-9522-2222-2222
    222
  end
end