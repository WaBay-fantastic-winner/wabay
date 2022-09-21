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
  has_many :messages
  has_many :comments, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :liked_comments,
           through: :like_comments, source: :comment, dependent: :destroy
  has_one_attached :avatar

  def liked?(comment)
    liked_comments.include?(comment)
  end

  private

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name || auth.info.email.split('@').first
      user.avatar_url = auth.info.image
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0, 20]
    end
  end
end