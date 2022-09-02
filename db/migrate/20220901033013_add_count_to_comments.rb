class AddCountToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :count, :integer, default: 0
  end
end
