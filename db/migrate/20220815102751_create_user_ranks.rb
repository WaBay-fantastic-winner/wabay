class CreateUserRanks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_ranks do |t|
      t.string :level
      t.integer :condition
      t.integer :bonus_feedback
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
