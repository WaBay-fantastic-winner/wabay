require 'rails_helper'

RSpec.feature "交易紀錄與取消", type: :feature do
  let(:user) { create(:user) }
  let(:donate_item) { create(:donate_item) }

  before do
    login_as user
    visit project_donate_item_path(project_id: donate_item.project_id, id: donate_item.id)
    click_on '直接贊助'
    
    within 'div.pay-tab-form' do
      find('input#CCpart1').set('4311')
      find('input#CCpart2').set('9522')
      find('input#CCpart3').set('2222')
      find('input#CCpart4').set('2222')

      find('input#creditMM').set('12')
      find('input#creditYY').set('24')

      find('input#CreditBackThree').set('222')
      find('input#CellPhoneCheck').set('0922222222')
    end
    click_on '立即付款'
    click_on '關閉 Turn off'
    click_on '立即付款'
    click_on '確定 Confirm'

    click_on '取得OTP服務密碼(Get the password)'

    within 'div.cvb-input' do
      find('input#OTP').set('1234')
    end
    click_on '送出(Submit)'
  end

  it "查詢交易訂單" do
    visit transactions_path
    expect(page).to have_content "#{donate_item.title}"
  end
end
