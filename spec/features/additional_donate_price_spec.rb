require 'rails_helper'

RSpec.feature "額外贊助介面功能", type: :feature do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:donate_item) { create(:donate_item) }

  before do
    login_as user
    visit project_donate_item_path(project_id: donate_item.project_id, id: donate_item)
  end

  it "數量" do
    click_on '+'
    click_on '+'
    click_on '+'
    click_on '-'

    amount = find('input#amount').value.to_i
    sum_from_test = amount * donate_item.price

    expect(page).to have_content(sum_from_test)
  end

  it "一百、一千" do
    click_on '100'
    click_on '1000'
    click_on '100'

    additional_donate_price = find('input#additional_donate_price').value.to_i
    sum_from_test = additional_donate_price + donate_item.price

    expect(page).to have_content(sum_from_test)
  end

  # it "自己輸入金額" do
  #   find('input#additional_donate_price').set(Faker::Number.number(digits: (4)))

  #   additional_donate_price = find('input#additional_donate_price').value.to_i
  #   sum_from_test = additional_donate_price + donate_item.price
  #   # 尚未，在輸入匡輸入數字後，要按下 enter 才能顯示出數字
  #   expect(page).to have_content(sum_from_test)
  # end

  it "使用額外贊助介面後進入交易" do
    click_on '+'
    click_on '+'
    click_on '100'
    click_on '1000'

    amount = find('input#amount').value.to_i
    additional_donate_price = find('input#additional_donate_price').value.to_i
    sum_from_test = "NT$#{(additional_donate_price + donate_item.price * amount).to_s.split('').insert(-4, ',').join}"

    click_on '直接結帳'
    ecpay_sum = find('dd.o-other-total')

    expect(ecpay_sum).to have_content(sum_from_test)
  end
end
