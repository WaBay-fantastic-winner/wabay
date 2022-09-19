# frozen_string_literal: true

class Project < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :donate_items, dependent: :destroy
  has_many :transactions
  has_rich_text :description
  has_one_attached :avatar
  has_many :comments, dependent: :destroy
  has_many :follows, as: :followable
  has_many :questions

  validates :organizer, :email, :phone, :title, :amount_target, :end_time,
            :description, presence: true
end
