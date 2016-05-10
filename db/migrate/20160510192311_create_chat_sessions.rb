class CreateChatSessions < ActiveRecord::Migration
  def change
    create_table :chat_sessions do |t|
      t.belongs_to :game_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
