class Stat < ActiveRecord::Base
  validates :name, pressence: true
end
