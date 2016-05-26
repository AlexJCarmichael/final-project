class UserChat < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => "User"

  has_many :messages, as: :chatable
end
