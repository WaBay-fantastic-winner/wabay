require 'rails_helper'

RSpec.feature "交易紀錄查詢", type: :feature do
  let(:user) { create(:user) }
  let(:donate_item) { create(:donate_item) }

  before do
    login_as user
    visit project_donate_item_path(project_id: donate_item.project_id, id: donate_item.id)
    click_on '直接贊助'
  end

  it "查詢交易訂單成功" do
    visit transactions_path
    expect(page).to have_content "#{donate_item.title}"
  end
end
