class SheetTemplate < ActiveRecord::Base
  has_many :game_sheets
  has_many :characters

  has_one :sheet_stat
  has_many :stats, through: :sheet_stat

  has_one :sheet_skill
  has_many :skills, through: :sheet_skill

  validates :game_name, presence: true
end
