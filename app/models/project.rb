# frozen_string_literal: true

class Project < ApplicationRecord
  #relationship
  belongs_to :user
  has_many :donate_items

  # validation
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time, :project_description,
            presence: true
  
  has_rich_text :project_description
  has_many :comments, dependent: :destroy
end

# frozen_string_literal: true

class Project < ApplicationRecord
  #relationship
  belongs_to :user
  has_many :donate_items

  # validation
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time, :project_description,
            presence: true
  
  has_rich_text :project_description
  has_many :comments, dependent: :destroy
end
