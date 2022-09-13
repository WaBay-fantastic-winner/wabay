class CreateAColumnToFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :a_column_to_follows do |t|
      add_column :follows, :user_id, :integer
      t.timestamps
    end
  end
end