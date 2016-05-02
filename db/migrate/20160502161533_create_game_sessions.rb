class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.string :session_name

      t.timestamps null: false
    end
  end
end
