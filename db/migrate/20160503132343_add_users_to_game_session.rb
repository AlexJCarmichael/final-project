class AddUsersToGameSession < ActiveRecord::Migration
  def change
    add_reference :game_sessions, :user, index: true
  end
end
