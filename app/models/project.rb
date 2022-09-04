# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_many :donate_items
  has_rich_text :project_description
  has_one_attached :avatar
  has_many :comments, dependent: :destroy, dependent: :destroy
  
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time,
            :project_description, presence: true
  has_rich_text :project_description
  has_one_attached :avatar
  has_many :comments, dependent: :destroy
end