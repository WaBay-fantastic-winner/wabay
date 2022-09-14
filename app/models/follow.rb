class Follow < ApplicationRecord
  belongs_to :followable, polymorphic: true

  # follow_list in projects_controller.rb
  scope :current_user_follow_this_project, ->(user_id, project_id) { where(user_id: user_id, followable_id: project_id[:id], followable_type: 'Project' ) }
end
