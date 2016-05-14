require 'chronic'
class GameSession < ActiveRecord::Base
  before_save :convert_time

  has_many :players
  has_many :actors, through: :players, source: :user
  has_many :characters, through: :players
  has_many :session_items
  has_many :items, through: :session_items, source: :equipment

  has_one :game_sheet
  has_one :sheet_template, through: :game_sheet, source: :sheet_template
  has_one :chat_session

  validates :session_name, presence: true

  def other_equipment
    Equipment.all.ids - self.items.ids
  end

  def convert_time
    self.due_at = Chronic::parse(self.game_time)
  end

  def actors
    self.characters.where(npc: false)
  end

  def npcs
    self.characters.where(npc: true)
  end

  def weapons
    self.items.where(category: "Weapon")
  end

  def armor
    self.items.where(category: "Armor")
  end

  def game_setup(dm)
    if self.persisted?
      ChatSession.create(game_session_id: self.id)
      Player.create!(user_id: dm.id, game_session_id: self.id)
    end
  end
end
