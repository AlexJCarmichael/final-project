class Stat < ActiveRecord::Base
  validates :name, presence: true
end
