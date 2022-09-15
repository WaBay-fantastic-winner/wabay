require 'rails_helper'

RSpec.feature "追蹤專案", type: :feature do
  let(:user) {create(:user)}
  let(:project) {create(:project)}
  before do
    login_as user
  end

  scenario "追蹤專案" do
    visit project_path(project.id)

    click_on '追蹤專案'

    visit follows_path

    expect(page).to have_content project.title
  end

  scenario "取消追蹤" do
    visit project_path(project.id)

    click_on '追蹤專案'

    visit follows_path

    click_on '取消追蹤'

    expect(page).to have_content '您目前還沒有任何追蹤的專案唷～'
  end
end
