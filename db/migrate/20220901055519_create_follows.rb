class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.boolean :follow
      t.integer :followable_id
      t.string :followable_type

      t.timestamps
    end
  end
end
