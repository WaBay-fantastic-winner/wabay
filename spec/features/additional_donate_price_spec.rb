require 'rails_helper'

RSpec.feature "Additional donate price", type: :feature, js: true do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:donate_item) { create(:donate_item) }
  let(:sum) { find('#sum').text.to_i }

  before do
    login_as user
    visit project_donate_item_path(project_id: donate_item.project_id, id: donate_item)
  end

  describe 'adjust the amount' do
    let(:amount) { find('input#amount').value.to_i }

    context 'when the times of clicking + button more than - button' do
      subject { amount }

      before do
        3.times { click_on '+' }
        1.times { click_on '-' }
      end

      it 'shows the amount and the sum' do
        expect(amount).to eq 3
        expect(sum).to eq amount * donate_item.price
      end
    end

    context 'when the times of clicking - button more than + button' do
      subject { amount }

      before do
        1.times { click_on '+' }
        3.times { click_on '-' }
      end

      it 'shows the amount is alway 1 and the sum is single price' do
        expect(amount).to eq 1
        expect(sum.to_i).to eq donate_item.price
      end
    end
  end

  describe 'adjust additional_donate_price' do
    let(:additional_donate_price) { find('input#additional_donate_price').value.to_i }

    context 'when click on 100' do
      before { click_on '100' }

      it 'shows the additional_donate_price which is 100 and the sum plus 100' do
        expect(additional_donate_price).to eq 100
        expect(sum).to eq additional_donate_price + donate_item.price
      end
    end

    context 'when click on 1000' do
      before { click_on '1000' }

      it 'shows the additional_donate_price which is 1000 and the sum plus 1000' do
        expect(additional_donate_price).to eq 1000
        expect(sum).to eq additional_donate_price + donate_item.price
      end
    end

    context 'when key price manually in additional_donate_price input' do
      subject { sum }

      let(:key_price) { Faker::Number.number(digits: (4)) }
      let(:sum_with_key_price) { key_price + donate_item.price }

      before do
        find('input#additional_donate_price').set(key_price).send_keys(:enter)
      end

      it { is_expected.to eq sum_with_key_price }

      context 'when click on 補整數' do
        let(:key_price_by_ceil) { (key_price.to_f/100).ceil * 100 }
        let(:sum_with_key_price_by_ceil) { key_price_by_ceil + donate_item.price }

        before { click_on '補整數' }

        it 'shows the additional_donate_price which is ceil by hundred and the sum plus it' do
          expect(additional_donate_price).to eq key_price_by_ceil
          expect(sum).to eq sum_with_key_price_by_ceil
        end
      end

      context 'when click on 最低額度' do
        before { click_on '最低額度' }

        it 'shows the additional_donate_price which is 0 and the sum is donate_item price' do
          expect(additional_donate_price).to eq 0
          expect(sum).to eq donate_item.price
        end
      end
    end
  end

  context 'when click on 直接贊助' do
    subject { page }
    before { click_on '直接贊助' }

    it { is_expected.to have_content('綠界') }
  end
end
