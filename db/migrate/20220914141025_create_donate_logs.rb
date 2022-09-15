class CreateDonateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :donate_logs do |t|
      t.belongs_to :donate_item, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
