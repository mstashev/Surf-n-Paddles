require 'uri'

class User < ApplicationRecord
  has_many :posts

  has_secure_password
  has_secure_token :api_token

  validates :name, :username, :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :avatar_url, require: false
  validates :avatar_url, format: { with: URI.regexp }, if: 'avatar_url.present?'
end
