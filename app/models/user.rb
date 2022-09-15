# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :projects, dependent: :destroy

  has_many :transactions, dependent: :destroy
  has_many :donate_items, through: :transactions

  has_many :comments, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :liked_comments,
           through: :like_comments, source: :comment, dependent: :destroy

  def liked?(comment)
    liked_comments.include?(comment)
  end

  private

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first || User.create(
      username: data['name'],
      email: data['email'],
      provider: data['provider'],
      uid: data['uid'],
      password: Devise.friendly_token[0, 20]
    )
  end
end
