class ChangeTypeColumnsInEquipment < ActiveRecord::Migration
  def change
    rename_column :equipment, :type, :category
    rename_column :equipment, :sub_type, :sub_category
  end
end
