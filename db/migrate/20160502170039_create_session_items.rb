class CreateSessionItems < ActiveRecord::Migration
  def change
    create_table :session_items do |t|
      t.belongs_to :game_session, index: true, foreign_key: true
      t.belongs_to :equipment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
