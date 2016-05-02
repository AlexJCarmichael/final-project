class User < ActiveRecord::Base
  include Clearance::User
  has_many :characters

  validates :user_name, pressence: true
  validates :email, pressence: true
  validates :name, pressence: true
end
