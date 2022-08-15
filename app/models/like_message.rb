class LikeMessage < ApplicationRecord
  belongs_to :user
  belongs_to :text_message
end

