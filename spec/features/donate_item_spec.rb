require 'rails_helper'

RSpec.describe "建立贊助方案", type: :feature do
  let(:project) { create(:project) }
  let(:user) { User.find(project.user_id) }

  it "贊助方案建立成功" do
    login_as user
    visit project_path(project)
    click_on '新增贊助方案'

    within 'div#donate_item' do
      fill_in 'donate_item_title', with: Faker::Food.ingredient
      fill_in 'donate_item_price', with: Faker::Number.number(digits: 4)
      fill_in 'donate_item_amount', with: Faker::Number.number(digits: 3)
      find("trix-editor").set(Faker::Food.description)
    end
    
    click_on '確認送出'
    expect(page).to have_content '贊助方案已建立，距離夢想更進一步！'
  end
end