class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game_session

  has_many :characters
end
