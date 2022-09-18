# frozen_string_literal: true

class DonateItem < ApplicationRecord
  acts_as_paranoid

  belongs_to :project
  has_many :donate_log, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :users, through: :transactions

  # action_text
  has_rich_text :content

  # validation
  validates :title, :content, :price, presence: true

  # pessimistic lock
  def donate_item_amount_decrease(amount)
    donate_item = DonateItem.find_by!(project_id: params['projectId'], title: params['donateItemTitle'])
    donate_item.with_lock do
      donate_item.decrement(:amount, amount.to_i)
      donate_item.save
    end
  end
end
