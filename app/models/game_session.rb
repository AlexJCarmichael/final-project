class GameSession < ActiveRecord::Base
  has_many :players
  has_many :actors, through: :players, source: :user
  has_many :characters, through: :players
  has_many :session_items
  has_many :items, through: :session_items, source: :equipment

  has_one :game_sheet
  has_one :sheet_template, through: :game_sheet, source: :sheet_template
  has_one :chat

  validates :session_name, presence: true

end
