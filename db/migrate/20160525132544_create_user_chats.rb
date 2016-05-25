class CreateUserChats < ActiveRecord::Migration
  def change
    create_table :user_chats do |t|
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.integer :recipient, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
