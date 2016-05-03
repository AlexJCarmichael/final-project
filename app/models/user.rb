class User < ActiveRecord::Base
  include Clearance::User
  has_many :players
  has_many :characters, through: :players
  has_many :playing_sessions, through: :players, source: :game_session
  has_many :game_sessions

  has_many :friends
  has_many :friendships, -> { where(friends: { status: Friend::ACCEPTED }) }, through: :friends, source: :to_user, foreign_key: :to_user
  has_many :pending_friendships, -> { where(friends: { status: Friend::PENDING }) }, through: :friends, source: :to_user, foreign_key: :to_user
  has_many :declined_friendships, -> { where(friends: { status: Friend::DECLINED }) }, through: :friends, source: :to_user, foreign_key: :to_user

  validates :user_name, presence: true
  validates :email, presence: true
  validates :name, presence: true

  def haters
    self.declined_friendships
  end

end
