class CreateCharStats < ActiveRecord::Migration
  def change
    create_table :char_stats do |t|
      t.belongs_to :character, index: true, foreign_key: true
      t.belongs_to :stat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
