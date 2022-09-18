# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :followable, polymorphic: true

  scope :current_user_follow_this_project, lambda { |user_id, project_id|
    where(user_id:, followable_id: project_id[:id], followable_type: 'Project')
  }
end
