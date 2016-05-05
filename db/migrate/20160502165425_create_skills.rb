class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :value, default: 0

      t.timestamps null: false
    end
  end
end
