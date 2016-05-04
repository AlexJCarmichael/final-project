class AddReferenceToGameSession < ActiveRecord::Migration
  def change
    add_reference :game_sessions, :sheet_template, index: true
  end
end
