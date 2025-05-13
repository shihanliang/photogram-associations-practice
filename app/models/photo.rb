class Photo < ApplicationRecord
  validates :poster, presence: true

  # Direct associations
  belongs_to :poster, class_name: "User", foreign_key: "owner_id", optional: true
  has_many :comments, class_name: "Comment", foreign_key: "photo_id"
  has_many :likes, class_name: "Like", foreign_key: "photo_id"

  # Indirect associations
  has_many :fans, through: :likes, source: :fan
end
