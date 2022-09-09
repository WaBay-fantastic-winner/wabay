class DonateItem < ApplicationRecord
  belongs_to :project

  has_many :transactions
  has_many :users, through: :transactions

  # action_text
  has_rich_text :content

  # validation
  validates :title, :content, :price, presence: true
end