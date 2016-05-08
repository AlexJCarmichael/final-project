class Friend < ActiveRecord::Base
  ACCEPTED = "accepted"
  DECLINED = "declined"
  PENDING = "pending"
  STATUSES = [ACCEPTED, PENDING, DECLINED]

  belongs_to :user
  belongs_to :to_user, :class_name => "User"

  validates :status, inclusion: { in: STATUSES,
    message: "%{value} is not a valid status" }
  validates :user_id, uniqueness: { scope: :to_user_id,
      message: "Can only make one friendship request" }
end
