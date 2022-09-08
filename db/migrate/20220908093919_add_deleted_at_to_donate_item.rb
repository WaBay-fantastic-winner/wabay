class AddDeletedAtToDonateItem < ActiveRecord::Migration[6.1]
  def change
    add_column :donate_items, :deleted_at, :datetime
    add_index :donate_items, :deleted_at
  end
end
