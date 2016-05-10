class ChatSession < ActiveRecord::Base
  belongs_to :game_session
end
