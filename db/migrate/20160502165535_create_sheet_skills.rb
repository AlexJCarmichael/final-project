class CreateSheetSkills < ActiveRecord::Migration
  def change
    create_table :sheet_skills do |t|
      t.belongs_to :sheet_template, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
