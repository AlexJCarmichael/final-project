class Character < ActiveRecord::Base
  belongs_to :player
  has_one :user, through: :player

  belongs_to :sheet_template

  has_many :char_stats, dependent: :destroy
  has_many :stats, -> { order(name: :asc) }, through: :char_stats

  has_many :char_skills, dependent: :destroy
  has_many :skills, -> { order(name: :asc) }, through: :char_skills
  has_many :char_equips, dependent: :destroy
  has_many :equipment, through: :char_equips

  validates :name, presence: true

  def as_json(_ = nil)
    super(include: { user: { only: [:name, :user_name, :email, :profile_image_id, :id]} } )
  end

end
