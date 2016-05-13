class AddNpcColumnToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :npc, :boolean
  end
end
