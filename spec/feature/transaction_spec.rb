require 'rails_helper'

RSpec.describe "建立交易", type: :feature do
  before do
    user = create(:user)
    login_as user

    @donate_item = create(:donate_item)
  end

  it "交易成功" do
    visit project_donate_item_path(project_id: @donate_item.project_id, id: @donate_item.id)
    click_on '贊助此項目', exact: false
    
    within 'li.card-num' do
      fill_in 'input#CCpart1', with: '4311'
      fill_in 'input#CCpart2', with: '9522'
      fill_in 'input#CCpart3', with: '2222'
      fill_in 'input#CCpart4', with: '2222'
    end
    expect(page).to have_content '金流服務由綠界科技'
  end
end
