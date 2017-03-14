require 'uri'

class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :name, :username, :email, presence: true, uniqueness: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :avatar_url, require: false
  validates :avatar_url, format: { with: URI.regexp }, if: 'avatar_url.present?'

  def to_s
    username
  end

end
