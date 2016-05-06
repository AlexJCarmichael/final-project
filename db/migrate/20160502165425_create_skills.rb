class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :rank, default: 0

      t.timestamps null: false
    end
  end
end
