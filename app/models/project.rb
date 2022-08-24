class Project < ApplicationRecord
  belongs_to :user
  validates :organizer, :email, :phone, :project_title,:project_amount_target, :project_end_time, :project_description, presence: true
end
