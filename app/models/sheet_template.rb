class SheetTemplate < ActiveRecord::Base
  belongs_to :game_session
  validates :game_name, presence: true
end
