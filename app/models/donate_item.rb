class DonateItem < ApplicationRecord
  # relationship
  belongs_to :project

  has_many :transactions
  has_many :users, through: :transactions

  #validation
  validates :title, :content, :price, presence: true
end
