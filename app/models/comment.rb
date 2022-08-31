# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

<<<<<<< HEAD
<<<<<<< HEAD
  has_many :like_comments, dependent: :destroy
  has_many :users, through: :like_comments, dependent: :destroy

=======
>>>>>>> feature/comment
=======
>>>>>>> feature/comment
  validates :content, presence: true
end
