require 'rails_helper'

RSpec.describe "Member login", type: :feature, js: true do
  subject { page }

  let(:user) { create(:user) }

  before do
    visit new_user_session_path
  end
  
  context "when member fill in the sheet" do
    before do
      within "form#new_user" do
        fill_in '請輸入Email', with: user.email
        fill_in '請輸入密碼', with: '33445566'
      end

      click_button '登入'
    end

    it { is_expected.to have_content "成功登入了。" }
  end
end