class DonateItem < ApplicationRecord
  belongs_to :project

  has_many :transactions
  has_many :users, through: transactions
end
