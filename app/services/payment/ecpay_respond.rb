# frozen_string_literal: true

module Payment
  class EcpayRespond
    require 'uri'
    require 'openssl'
    require 'cgi'
    require 'net/http'

    def initialize(params)
  
      @basic_params = {
        "CustomField1"=> params["CustomField1"],
        "CustomField2"=> params["CustomField2"], 
        "CustomField3"=> params["CustomField3"], 
        "CustomField4"=> params["CustomField4"], 
        "MerchantID"=> params["MerchantID"], 
        "MerchantTradeNo"=> params["MerchantTradeNo"], 
        "PaymentDate"=> params["PaymentDate"], 
        "PaymentType"=> params["PaymentType"], 
        "PaymentTypeChargeFee"=> params["PaymentTypeChargeFee"], 
        "RtnCode"=> params["RtnCode"], 
        "RtnMsg"=> params["RtnMsg"], 
        "SimulatePaid"=> params["SimulatePaid"], 
        "StoreID"=> params["StoreID"], 
        "TradeAmt"=> params["TradeAmt"], 
        "TradeDate"=> params["TradeDate"], 
        "TradeNo"=> params["TradeNo"],
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
    end
  end
end