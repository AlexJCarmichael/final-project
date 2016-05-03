class Friend < ActiveRecord::Base
  ACCEPTED = "accepted"
  DECLINED = "declined"
  PENDING = "pending"
  STATUSES = [ACCEPTED, PENDING, DECLINED]

  belongs_to :user
  belongs_to :to_user, :class_name => "User"

  validates :status, inclusion: { in: STATUSES,
    message: "%{value} is not a valid status" }
end
