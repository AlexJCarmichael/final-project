class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :sheet_template

  has_many :char_stats
  has_many :stats, through: :char_stats

  validates :name, presence: true
end
