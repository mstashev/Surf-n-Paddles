class Post < ApplicationRecord
  belongs_to :user

  # mount_uploader :photo, PostPhotoUploader

  validates :title, presence: true
  validates :body, presence: true

  def is_owner?(this_user)
    user == this_user
  end

end
