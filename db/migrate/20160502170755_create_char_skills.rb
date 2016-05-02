class CreateCharSkills < ActiveRecord::Migration
  def change
    create_table :char_skills do |t|
      t.belongs_to :character, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
