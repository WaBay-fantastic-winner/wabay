
class Project < ApplicationRecord
  belongs_to :user
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time,
            :project_description, presence: true
  has_rich_text :project_description
  has_many :comments, dependent: :destroy
end
=======

class Project < ApplicationRecord
  belongs_to :user
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time,
            :project_description, presence: true
  has_rich_text :project_description
  has_many :comments, dependent: :destroy
end
>>>>>>> origin/feature/liked_comment_reload
