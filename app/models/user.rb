class User < ActiveRecord::Base
  include Clearance::User
  has_many :characters

  validates :user_name, presence: true
  validates :email, presence: true
  validates :name, presence: true
end
