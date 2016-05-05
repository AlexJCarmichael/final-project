class SheetTemplate < ActiveRecord::Base
  has_many :game_sheets
  has_many :characters

  validates :game_name, presence: true
end
