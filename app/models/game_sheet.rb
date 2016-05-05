class GameSheet < ActiveRecord::Base
  belongs_to :sheet_template
  belongs_to :game_session
end
