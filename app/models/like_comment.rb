# frozen_string_literal: true

class LikeComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
