require 'rails_helper'

RSpec.feature 'Project', type: :feature, js: true do
  subject { page }

  let(:project) { create(:project) }
  let(:user) { project.user }

  before do
    login_as user
  end

  context 'when users create project' do
    before do
      visit '/'
      click_on '提案'

      within 'form#new_project' do
        fill_shared_fields
        fill_in 'project_email', with: Faker::Internet.email
        fill_in 'project_phone', with: Faker::PhoneNumber
        fill_in 'project_title', with: Faker::Food.dish
      end
      click_on '確認送出'
    end

    it { is_expected.to have_content '提案成功 !!' }
  end

  context 'when users edit project' do
    before do
      visit project_path(project.id)
      click_on '編輯專案'

      within 'div#edit_project' do
        fill_shared_fields
      end

      click_on '確認送出'
    end

    it { is_expected.to have_content '提案更新成功 !!' }
  end

  context 'when users delete project' do
    before do
      visit project_path(project.id)
      accept_confirm { click_on '刪除專案' }
      visit '/'
    end

    it { is_expected.not_to have_content project.title }
  end
end
