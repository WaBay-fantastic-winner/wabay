class RenameDonateItemColumnCount < ActiveRecord::Migration[6.1]
  def change
    rename_column :donate_items, :count, :donate_logs_count
  end
end
