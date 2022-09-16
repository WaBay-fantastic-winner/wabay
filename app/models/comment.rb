# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :comments, foreign_key: :parent_id, dependent: :destroy, inverse_of: :parent
  has_many :like_comments, dependent: :destroy
  has_many :users, through: :like_comments, dependent: :destroy

  validates :content, presence: true
end
