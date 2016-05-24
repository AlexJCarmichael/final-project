class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.belongs_to :user, index: true, foreign_key: true
      t.references :chatable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
