require 'rails_helper'

RSpec.feature '專案功能', type: :feature, js: true do
  let(:project) { create(:project) }
  let(:user) { User.find(project.id) }

  it "專案新增成功" do
    login_as user
    visit '/'
    find("a.rspec-link").click

    within 'form#new_project' do
      fill_in 'project_organizer', with: Faker::Name.name
      fill_in 'project_email', with: Faker::Internet.email
      fill_in 'project_phone', with: Faker::PhoneNumber
      fill_in 'project_title', with: Faker::Food.dish
      fill_in 'project_amount_target', with: Faker::Number.number(digits: 4)
      attach_file('project_avatar', File.absolute_path('app/assets/images/wubay.png'))
      find("input#project_end_time").set("#{Date.new.end_of_year + 1}")
      find("trix-editor").set(Faker::Food.description) 
    end
    click_on '確認送出'
    expect(page).to have_content('提案成功 !!')
  end

  it "專案編輯成功" do
    login_as user
    visit project_path(project.id)
    click_on '編輯專案'

    within 'div#edit_project' do
      fill_in 'project_organizer', with: Faker::Name.name
      fill_in 'project_amount_target', with: Faker::Number.number(digits: 4)
      attach_file('project_avatar', File.absolute_path('app/assets/images/wubay.png'))
      find("input#project_end_time").set("#{Date.new.end_of_year + 1}")
      find("trix-editor").set(Faker::Food.description) 
    end

    click_on '確認送出'
    expect(page).to have_content '提案更新成功 !!'
  end

  it "專案刪除成功" do
    login_as user
    visit project_path(project.id)

    accept_confirm do
      click_on '刪除專案'
    end

    expect(page).not_to have_content project.title
  end
end