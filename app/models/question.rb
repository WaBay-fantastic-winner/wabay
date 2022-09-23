# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :content, presence: true

end
