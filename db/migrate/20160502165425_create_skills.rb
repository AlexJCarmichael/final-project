class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :value

      t.timestamps null: false
    end
  end
end
