class CharStat < ActiveRecord::Base
  belongs_to :character
  belongs_to :stat

  validates :stat_id, uniqueness: { scope: :character_id }
end
