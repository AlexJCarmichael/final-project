class SheetTemplate < ActiveRecord::Base
  validates :game_name, presence: true
end
