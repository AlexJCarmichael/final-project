class CreateUserChats < ActiveRecord::Migration
  def change
    create_table :user_chats do |t|
      t.integer :user_id, null: false, index: true
      t.integer :to_user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
