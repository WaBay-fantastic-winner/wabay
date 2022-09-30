# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 github]

  has_many :projects, dependent: :destroy

  has_many :transactions, dependent: :destroy
  has_many :donate_items, through: :transactions
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :liked_comments,
           through: :like_comments, source: :comment, dependent: :destroy
  has_one_attached :avatar

  # validatations
  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true

  def liked?(comment)
    liked_comments.include?(comment)
  end

  private
  # def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first    
  #   if user
  #     return user
  #   else
  #     existing_user = User.where(:email => data["email"]).first
  #     if  existing_user
  #       existing_user.uid = access_token.uid
  #       existing_user.provider = access_token.provider
  #       existing_user.save!
  #       return existing_user
  #     else
  #   # Uncomment the section below if you want users to be created if they don't exist
  #       user = User.create(
  #           username: data["name"],
  #           email: data["email"],
  #           password: Devise.friendly_token[0,20],
  #           provider: access_token.provider,
  #           uid: access_token.uid,
  #         )
  #     end
  #   end
  # end

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