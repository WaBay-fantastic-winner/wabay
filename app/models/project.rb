class Project < ApplicationRecord
  belongs_to :user

  has_many :donate_items

  has_many :text_messages

  has_many :follow_projects
end
