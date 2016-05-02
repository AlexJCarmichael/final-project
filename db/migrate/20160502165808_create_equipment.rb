class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name, null: false
      t.string :damage
      t.string :type, null: false
      t.string :sub_type
      t.string :armor
      t.string :weight
      t.string :reach
      t.string :effects

      t.timestamps null: false
    end
  end
end
