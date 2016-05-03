class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game_session
end
