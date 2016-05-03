class User < ActiveRecord::Base
  include Clearance::User
  has_many :players
  has_many :characters, through: :players
  has_many :playing_sessions, through: :players, source: :game_session
  has_many :game_sessions

  validates :user_name, presence: true
  validates :email, presence: true
  validates :name, presence: true

end
