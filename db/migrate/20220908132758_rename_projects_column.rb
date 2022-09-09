class RenameProjectsColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :project_title, :title
    rename_column :projects, :project_amount_target, :amount_target
    rename_column :projects, :project_end_time, :end_time
    rename_column :projects, :project_description, :description
  end
end