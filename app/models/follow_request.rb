class FollowRequest < ApplicationRecord
  validates :sender, presence: true
  validates :recipient, presence: true
  validates :recipient_id, uniqueness: { scope: [:sender_id] }

  # Direct associations
  belongs_to :sender, class_name: "User", foreign_key: "sender_id", optional: true
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id", optional: true
end
