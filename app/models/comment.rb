class Comment < ApplicationRecord
  validates :commenter, presence: true

  # Direct associations
  belongs_to :commenter, class_name: "User", foreign_key: "author_id", optional: true
  belongs_to :photo, class_name: "Photo", optional: true
end
