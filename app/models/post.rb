class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
  validates :title, length: { maximum: 255 }

end
