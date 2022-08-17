class AddPriceColumnToDonateItems < ActiveRecord::Migration[6.1]
  def change
    add_column :donate_items, :price, :integer
  end
end
