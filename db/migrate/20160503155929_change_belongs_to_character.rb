class ChangeBelongsToCharacter < ActiveRecord::Migration
  def change
    remove_column :characters, :user_id
    add_reference :characters, :players, index: true
  end
end
