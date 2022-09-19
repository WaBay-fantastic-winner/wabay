require 'rails_helper'

RSpec.feature "交易訂單取消", type: :feature do
  let(:user) { create(:user) }
  let(:donate_item) { create(:donate_item) }

  before do
    login_as user
    visit project_donate_item_path(project_id: donate_item.project_id, id: donate_item.id)
    click_on '直接贊助'
  end

  it "取消交易訂單成功" do 
    login_as user
    visit transactions_path

    accept_confirm do
      click_link '取消交易訂單'
    end

    expect(page).not_to have_content 'transaction.serial'
  end
end