class Skill < ActiveRecord::Base
  validates :name, presence: true
end
