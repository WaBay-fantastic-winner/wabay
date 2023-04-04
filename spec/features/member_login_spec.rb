require 'rails_helper'

RSpec.describe "會員登入", type: :feature, js: true do
  let(:user) { create(:user) }
  
  it "登入成功" do
    visit '/'
    click_on '登入'
    within "form#new_user" do
      fill_in '請輸入Email', with: user.email
      fill_in '請輸入密碼', with: '33445566'
    end
    click_button '登入'
    expect(page).to have_content "成功登入了。"
  end
end