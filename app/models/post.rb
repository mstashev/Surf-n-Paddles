class Post < ApplicationRecord
  belongs_to :user

  mount_uploader :pic, PostPhotoUploader

  delegate :avatar_url, to: :user

  validates :title, presence: true
  validates :body, presence: true

  def is_owner?(this_user)
    user == this_user
  end

end
