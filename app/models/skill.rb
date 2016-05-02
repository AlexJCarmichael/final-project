class Skill < ActiveRecord::Base
  validates :name, pressence: true
end
