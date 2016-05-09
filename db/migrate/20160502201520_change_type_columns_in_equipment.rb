class ChangeTypeColumnsInEquipment < ActiveRecord::Migration
  def change
    rename_column :equipment, :type, :category, null: :false
    rename_column :equipment, :sub_type, :sub_category, null: :false
  end
end
