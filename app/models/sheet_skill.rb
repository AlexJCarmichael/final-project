class SheetSkill < ActiveRecord::Base
  belongs_to :sheet_template
  belongs_to :skill
end
