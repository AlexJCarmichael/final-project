class SheetTemplate < ActiveRecord::Base
  belongs_to :game_session

  has_many :characters
  
  validates :game_name, presence: true
end
