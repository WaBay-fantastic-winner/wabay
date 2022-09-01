class AddCountToLikeComments < ActiveRecord::Migration[6.1]
  def change
    add_column :like_comments, :count, :integer, default: 0
  end
end
