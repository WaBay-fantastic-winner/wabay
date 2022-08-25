class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :organizer
      t.string :email
      t.string :phone
      t.string :project_title
      t.integer :project_amount_target
      t.string :project_end_time
      t.string :project_description
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
