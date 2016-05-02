class CharEquip < ActiveRecord::Base
  belongs_to :character
  belongs_to :equipment
end
