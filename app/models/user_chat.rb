class UserChat < ActiveRecord::Base
  belongs_to :user

  has_many :messages, as: :chatable
  has_many :participants, through: :users
end
