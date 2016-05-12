class CreateRefileAttachments < ActiveRecord::Migration
  def up
    create_table :refile_attachments do |t|
      t.string :namespace, null: false
    end
    add_index :refile_attachments, :namespace
  end

  def drop
    remove_index :refile_attachments, :namespace
    drop_table :refile_attachments
  end
end

