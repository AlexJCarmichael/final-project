class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :sheet_template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
