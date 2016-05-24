class ChatSession < ActiveRecord::Base
  belongs_to :game_session

  has_many :messages, as: :chatable

end
