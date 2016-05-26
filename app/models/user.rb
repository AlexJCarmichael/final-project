class User < ActiveRecord::Base
  include Clearance::User
  # before_save :set_default_image

  attachment :profile_image

  has_many :players
  has_many :characters, through: :players
  has_many :playing_sessions, through: :players, source: :game_session
  has_many :game_sessions
  has_many :sheet_templates
  has_many :messages
  has_many :user_chats

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

  def is_gm_of?(game)
    game.user_id == self.id
  end

  def has_chat?
    self.user_chats.present?
  end

  def player_id(game_id)
    self.players.find_by(game_session_id: game_id).id
  end

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

  def set_default_image
    if profile_image_id.nil?
      self.profile_image = Avatarly.generate_avatar(self.name, size: 60)
      self.save
    end
  end

  def photo_url
    ActionController::Base.helpers.attachment_url(self, :profile_image, :fit, 60, 60, format: :jpg) ||
    ActionController::Base.helpers.gravatar_url(self.email)
  end

  def as_json(_ = nil)
    super(only: [:name, :user_name, :email, :profile_image_id, :id],
          methods: [:photo_url])
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
