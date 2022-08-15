class TextMessage < ApplicationRecord
  belongs_to :user
  belongs_to :project

  has_many :like_messages
end

