class Equipment < ActiveRecord::Base
  validates :name, pressence: true
  validates :type, pressence: true
end
