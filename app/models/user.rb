class User < ApplicationRecord
  has_many :projects
  
  has_one :user_rank

  has_many :text_messages

  has_many :follow_projects

  has_many :like_messages

  has_many :transactions
  has_many :donate_items, through: :transactions
end
