# frozen_string_literal: true

class DonateItem < ApplicationRecord
  acts_as_paranoid

  belongs_to :project
  has_many :donate_logs, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :users, through: :transactions

  # action_text
  has_rich_text :content

  # validation
  validates :title, :content, :price, presence: true
end
