class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
  validates :title, length: { maximum: 255 }

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  
  has_attached_file :photo
  
end
