class CharSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill

  validates :skill_id, uniqueness: { scope: :character_id }
end
