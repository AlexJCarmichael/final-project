class AddColumnsToGameSession < ActiveRecord::Migration
  def change
    add_column :game_sessions, :game_time, :timestamp
  end
end
