require 'rails_helper'

RSpec.describe "贊助方案", type: :feature do
  let(:donate_item) { create(:donate_item)}
  let(:project) { Project.find(donate_item.project_id) }
  let(:user) { User.find(project.user_id) }
  
  it "建立成功" do
    login_as user
    visit project_path(project)
    click_on '新增贊助方案'

    within 'section#donate_item' do
      fill_in 'donate_item_title', with: Faker::Food.ingredient
      fill_in 'donate_item_price', with: Faker::Number.number(digits: 4)
      fill_in 'donate_item_amount', with: Faker::Number.number(digits: 3)
      find("trix-editor").set(Faker::Food.description)
    end
    
    click_on '確認送出'
    expect(page).to have_content '贊助方案已建立，距離夢想更進一步！'
  end

  it "編輯成功" do
    login_as user
    visit edit_project_donate_item_path(project.id, donate_item.id)

    within 'section#donate_item' do
      find("trix-editor").set(Faker::Food.description)
    end
    
    click_on '確認送出'
    expect(page).to have_content '贊助方案已編輯'
  end

  it "刪除成功" do
    login_as user
    visit project_path(project)

    accept_confirm do
      click_on '刪除贊助方案'
    end

    expect(page).not_to have_content "#{donate_item.title}"
  end
end