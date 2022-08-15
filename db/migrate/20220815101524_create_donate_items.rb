class CreateDonateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :donate_items do |t|
      t.string :title
      t.text :content
      t.belongs_to :usesr, null: false, foreign_key: true
      t.belongs_to :project, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
