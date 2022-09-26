# frozen_string_literal: true

class Project < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :donate_items, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_rich_text :description
  has_one_attached :avatar
  has_many :comments, dependent: :destroy
  has_many :follows, as: :followable, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :organizer, :email, :phone, :title, :amount_target, :end_time,
            :description, :avatar, presence: true
  validates :avatar, attached: true, content_type: ['image/png', 'image/jpeg', 'image/jpg', 'image/webp', 'image/gif']
end
