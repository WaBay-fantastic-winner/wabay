class CreateDonateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :donate_items do |t|
      t.string :title
      t.text :content
      t.integer :price
      t.integer :count
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end