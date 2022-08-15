class CreateLikeMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :like_messages do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :text_message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
