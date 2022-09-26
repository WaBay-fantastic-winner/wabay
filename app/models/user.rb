# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github google_oauth2]

  has_many :projects, dependent: :destroy

  has_many :transactions, dependent: :destroy
  has_many :donate_items, through: :transactions
  has_many :messages
  has_many :comments, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :liked_comments,
            through: :like_comments, source: :comment, dependent: :destroy
  has_one_attached :avatar

  def liked?(comment)
    liked_comments.include?(comment)
  end

  validates :email, presence: true
  validates :password, presence: true

  private

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    # Uncomment the section below if you want users to be created if they don't exist
    user ||= User.create(
      email: data['email'],
      username: data['name'] || data['email'].split('@').first,
      password: Devise.friendly_token[0, 20]
    )
    user
  end
end