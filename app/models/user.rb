require 'uri'

class User < ApplicationRecord
  has_many :posts

  has_secure_password

  mount_uploader :profile_pic, UserPhotoUploader

  validates :name, :username, :email, presence: true, uniqueness: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :avatar_url, require: false
  validates :avatar_url, format: { with: URI.regexp }, if: 'avatar_url.present?'

  def to_s
    username
  end

  def personage(version = :standard)
    if profile_pic?
      profile_pic.versions[version].url
    elsif !avatar_url.blank?
      avatar_url
    else
      "https://pbs.twimg.com/profile_images/810194608093282305/dj7DmKQ9.jpg"
    end
  end

end
