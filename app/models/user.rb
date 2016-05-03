class User < ActiveRecord::Base
  include Clearance::User
  has_many :players
  has_many :characters, through: :players
  has_many :playing_sessions, through: :players, source: :game_session
  has_many :game_sessions

  has_many :friends # , class_name: :Friend, foriegn_key: :user_id
  has_many :requested_friends, class_name: :Friend, foreign_key: :to_user_id

  #Sent requests
  has_many :friendships, -> { where(friends: { status: Friend::ACCEPTED }) }, through: :friends, source: :to_user
  has_many :pending_friendships, -> { where(friends: { status: Friend::PENDING }) }, through: :friends, source: :to_user
  has_many :declined_friendships, -> { where(friends: { status: Friend::DECLINED }) }, through: :friends, source: :to_user

  #Received requests
  has_many :accepted_friendships, -> { where(friends: { status: Friend::ACCEPTED }) }, through: :requested_friends, source: :user
  has_many :awaiting_friendships, -> {  where(friends: { status: Friend::PENDING }) }, through: :requested_friends, source: :user
  has_many :declined_requests, -> { where(friends: { status: Friend::DECLINED }) }, through: :requested_friends, source: :user

  validates :user_name, presence: true
  validates :email, presence: true
  validates :name, presence: true

  def my_friends
    self.friendships | self.accepted_friendships
  end

  def my_pending_friends
    self.pending_friendships | self.awaiting_friendships
  end

  private
  def haters
    self.declined_friendships
  end

  def scrubs
    self.declined_requests
  end

  def taylor_left_eye_chilli
    self.declined_requests | self.declined_friendships
  end
end
