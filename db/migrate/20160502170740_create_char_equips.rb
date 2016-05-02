class CreateCharEquips < ActiveRecord::Migration
  def change
    create_table :char_equips do |t|
      t.belongs_to :character, index: true, foreign_key: true
      t.belongs_to :equipment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
