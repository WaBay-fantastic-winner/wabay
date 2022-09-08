# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects

  has_many :transactions
  has_many :donate_items, through: :transactions

  has_many :comments, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :liked_comments, 
            through: :like_comments, source: :comment, dependent: :destroy

            
  def liked?(comment)
   liked_comments.include?(comment)
  end
end