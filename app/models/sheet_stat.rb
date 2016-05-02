class SheetStat < ActiveRecord::Base
  belongs_to :sheet_template
  belongs_to :stat
end
