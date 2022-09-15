# frozen_string_literal: true

module Payment
  class EcpayRespond
    attr_reader :status, :message, :result, :order_no, :trans_no

    def initialize(params)
      @key = 'your hash key'
      @iv = 'your hash iv'

      response = decrypy(params)
      @status = response['Status']
      @message = response['Message']
      @result = response['Result']
      @order_no = @result['MerchantOrderNo']
      @trans_no = @result['TradeNo']
      # etc...
    end

    def success?
      status == 'SUCCESS'
    end

    private

    # AES 解密
    def decrypy(encrypted_data)
      encrypted_data = [encrypted_data].pack('H*')
      decipher = OpenSSL::Cipher.new('aes-256-cbc')
      decipher.decrypt
      decipher.padding = 0
      decipher.key = @key
      decipher.iv = @iv
      data = decipher.update(encrypted_data) + decipher.final
      raw_data = strippadding(data)
      JSON.parse(raw_data)
    end

    def strippadding(data)
      slast = data[-1].ord
      slastc = slast.chr
      string_match = /#{slastc}{#{slast}}/ =~ data
      if string_match.nil?
        false
      else
        data[0, string_match]
      end
    end
  end
end
