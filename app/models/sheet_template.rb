class SheetTemplate < ActiveRecord::Base
  validates :game_name, pressence: true
end
