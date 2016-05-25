class UserChat < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => "User"

  has_many :messages, as: :chatable
  has_many :participants, through: :users
end
