class AddAmountColumnToDonateItems < ActiveRecord::Migration[6.1]
  def change
    add_column :donate_items, :amount, :integer
  end
end
