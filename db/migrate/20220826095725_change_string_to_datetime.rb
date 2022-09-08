class ChangeStringToDatetime < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :project_end_time, 'timestamp USING CAST(project_end_time AS timestamp)'
  end
end
