class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :game_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
