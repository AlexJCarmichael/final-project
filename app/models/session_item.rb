class SessionItem < ActiveRecord::Base
  belongs_to :game_session
  belongs_to :equipment
end
