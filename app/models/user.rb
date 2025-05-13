class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # Direct associations
  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :own_photos, class_name: "Photo", foreign_key: "owner_id"
  has_many :likes, class_name: "Like", foreign_key: "fan_id"

  has_many :sent_follow_requests, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :received_follow_requests, class_name: "FollowRequest", foreign_key: "recipient_id"

  # Scoped direct associations
  has_many :accepted_sent_follow_requests, -> { where(status: "accepted") }, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :accepted_received_follow_requests, -> { where(status: "accepted") }, class_name: "FollowRequest", foreign_key: "recipient_id"

  # Indirect associations
  has_many :liked_photos, through: :likes, source: :photo
  has_many :commented_photos, through: :comments, source: :photo

  # Indirect associations built on scoped associations
  has_many :followers, through: :accepted_received_follow_requests, source: :sender
  has_many :leaders, through: :accepted_sent_follow_requests, source: :recipient

  has_many :feed, through: :leaders, source: :own_photos
  has_many :discover, through: :leaders, source: :liked_photos
end
