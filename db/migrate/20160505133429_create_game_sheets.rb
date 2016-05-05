class CreateGameSheets < ActiveRecord::Migration
  def change
    create_table :game_sheets do |t|
      t.belongs_to :sheet_template, index: true, foreign_key: true
      t.belongs_to :game_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
