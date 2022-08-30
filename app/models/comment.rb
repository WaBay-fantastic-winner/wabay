# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :like_comments
  has_many :users, through: :like_comments

  validates :content, presence: true
end
