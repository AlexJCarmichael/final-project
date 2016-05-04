class Character < ActiveRecord::Base
  belongs_to :player
  has_one :user, through: :player

  belongs_to :sheet_template

  has_many :char_stats
  has_many :stats, through: :char_stats

  has_many :char_skills
  has_many :skills, through: :char_skills

  has_many :char_equips
  has_many :equipment, through: :char_equips

  validates :name, presence: true

  def as_json(_ = nil)
    super(include: [:user])
  end

end
