class User < ActiveRecord::Base
  include Clearance::User
  attachment :profile_image

  has_many :players
  has_many :characters, through: :players
  has_many :playing_sessions, through: :players, source: :game_session
  has_many :game_sessions
  has_many :sheet_templates
  has_many :messages

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

  def my_games
    joined_games = self.players.map do |player|
      player.game_session
    end
    self.game_sessions | joined_games
  end

  def my_friends
    self.friendships | self.accepted_friendships
  end

  def my_pending_friends(id)
    Friend.where("(user_id = ? or to_user_id = ?) and status = ?", id, id, Friend::PENDING)
  end

  def as_json(_ = nil)
    super(exclude: [:encrypted_password, :password_confirmation])
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
