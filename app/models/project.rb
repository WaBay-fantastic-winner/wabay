# frozen_string_literal: true

class Project < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user
  has_many :donate_items, dependent: :destroy
  has_rich_text :project_description
  has_many :comments, dependent: :destroy
  
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time,
            :project_description, presence: true
end