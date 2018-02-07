class Post < ApplicationRecord

  belongs_to :user

  validates :title, :content, presence: true
  validates :title, length: { maximum: 255 }

end
