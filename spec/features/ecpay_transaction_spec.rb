require 'rails_helper'

RSpec.describe "建立交易", type: :feature, js: true do
  let(:user) { create(:user) }
  let(:donate_item) { create(:donate_item) }

  it "進入綠界交易頁面" do
    login_as user
    visit project_donate_item_path(project_id: donate_item.project_id, id: donate_item.id)
    click_on '直接贊助'
    expect(page).to have_content('綠界')
  end
end
