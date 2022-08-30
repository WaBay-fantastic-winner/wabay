class CreateLikeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :like_comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
