class GameSession < ActiveRecord::Base
  has_many :users
  has_many :characters
  has_many :items, through: :session_items, source: :equipment

  has_one :sheet_template
  has_one :chat

  validates :session_name, presence: true
end
