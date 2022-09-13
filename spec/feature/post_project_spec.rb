require 'rails_helper'

RSpec.feature 'post a new project', type: :feature do
    let(:user) { create(:user) }

  it "文章新增成功" do
    login_as user
    
    visit '/'
    click_button "提案"

    within 'div#new_project' do
      fill_in 'project_organizer', with: Faker::Name.name
      fill_in 'project_email', with: Faker::Internet.email
      fill_in 'project_phone', with: Faker::PhoneNumber
      fill_in 'project_title', with: Faker::Food.dish
      fill_in 'project_amount_target', with: Faker::Number.number(digits: 4)
      fill_in 'project_end_time', with: '002022/09/15' # 年份有六位數。
      find("trix-editor").set(Faker::Food.description) # action_text 無法用 fill_in 找到。
    end
    click_on '確認送出'
    expect(page).to have_content('提案成功 !!')
  end
end