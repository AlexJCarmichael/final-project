class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.integer :to_user_id, null: false, index: true, foreign_key: true
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
