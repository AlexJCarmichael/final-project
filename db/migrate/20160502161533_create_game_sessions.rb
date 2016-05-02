class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.string :session_name, null: false

      t.timestamps null: false
    end
  end
end
