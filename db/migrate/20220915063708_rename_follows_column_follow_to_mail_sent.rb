class RenameFollowsColumnFollowToMailSent < ActiveRecord::Migration[6.1]
  def change
    rename_column :follows, :follow, :mail_sent
  end
end
