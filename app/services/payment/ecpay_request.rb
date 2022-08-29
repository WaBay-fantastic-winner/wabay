module Payment
  class EcpayRequest
    require 'uri'
    require 'openssl'
    require 'CGI'
  
    def test
      'test'
    end
  
    def initialize(merchant_trade_no, 
                   merchant_trade_date,
                   title, 
                   price)
  
      @params = {
        "TradeDesc": "專案贊助交易", 
        "PaymentType": "aio", 
        "MerchantTradeDate": merchant_trade_date, 
        "MerchantTradeNo": merchant_trade_no, 
        "MerchantID": 3002607, 
        "ReturnURL": "https://f25a-103-3-192-33.jp.ngrok.io/payment/returnpage",
        "ItemName": title,
        "TotalAmount": price, 
        "ChoosePayment": "ALL", 
        "IgnorePayment": "WebATM#ATM#CVS#BARCODE",
        "EncryptType": 1
      }
    end
  
    def perform
      encrypt(@params)
    end
  
    private
  
    def encrypt(params) 
      # 1.由A到Z的順序並轉換為 query string
      order_query_string = URI.encode_www_form(params.to_a.sort!)
      # 2.前後加 Key 跟 IV
      key_vi = "HashKey=pwFHCqoQZGmho4w6&" + order_query_string + "&HashIV=EkRm7iFT261dpevs"
      # 3.進行 URL encode 並轉小寫
      url_encode = (CGI.escape key_vi).downcase.gsub!(/%25/, '%').gsub!(/%2b/, '+')
      # 4.sha256加密轉大寫
      encrypted_result = Digest::SHA256.hexdigest(url_encode).upcase
    end
  
    def request
      #尚未
    end
  
  
  end
end