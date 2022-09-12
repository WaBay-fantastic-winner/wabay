class Follow < ApplicationRecord
  belongs_to :followable, :polymorphic => true

  # follow_list in projects_controller.rb
  # scope :current_user_follow_this_project, -> (id, params) { where(user_id: id, followable_id: params[:id], followable_type: "Project" ) }

end
