class ChatSession < ActiveRecord::Base
  belongs_to :game_session

  has_many :messages
  
end
