# frozen_string_literal: true

h1 = {
  TradeDesc: '專案贊助交易',
  PaymentType: 'aio',
  MerchantTradeDate: '2022/08/30 11:52:33',
  MerchantTradeNo: '123123',
  MerchantID: '3002607',
  ReturnURL: 'https://f25a-103-3-192-33.jp.ngrok.io/payment/returnpage',
  ItemName: 'title',
  TotalAmount: '5555',
  ChoosePayment: 'ALL',
  IgnorePayment: 'WebATM#ATM#CVS#BARCODE',
  EncryptType: '1'
}

p h1.transform_values { |v|
    if v == h1[:MerchantID]
      v.to_i
    elsif v == h1[:TotalAmount]
      v.to_i
    elsif v == h1[:EncryptType]
      v.to_i
    else
      v
    end
  }
