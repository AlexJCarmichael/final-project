class CreateSheetTemplates < ActiveRecord::Migration
  def change
    create_table :sheet_templates do |t|
      t.string :game_name, null: false
      t.timestamps null: false
    end
  end
end
