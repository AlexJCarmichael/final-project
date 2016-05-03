class Friend < ActiveRecord::Base
  ACCEPTED = "accepted"
  DECLINED = "declined"
  PENDING = "pending"

  belongs_to :user
  belongs_to :to_user, :class_name => "User"

  # validates :from_user, numericality: { only_integer: true }
  # validates :to_user, numericality: { only_integer: true }
  validates :status, inclusion: { in: %w(pending accepted rejected),
    message: "%{value} is not a valid status" }
end
