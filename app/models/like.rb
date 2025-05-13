class Like < ApplicationRecord
  validates :fan, presence: true
  validates :photo, presence: true
  validates :photo_id, uniqueness: { scope: [:fan_id] }

  # Direct associations
  belongs_to :fan, class_name: "User", foreign_key: "fan_id", optional: true
  belongs_to :photo, class_name: "Photo", optional: true
end
