class AddColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :current_total, :integer, default: 0
  end
end
