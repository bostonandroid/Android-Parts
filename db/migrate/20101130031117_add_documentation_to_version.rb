class AddDocumentationToVersion < ActiveRecord::Migration
  def self.up
    change_table :versions do |t|
      t.string :doc_file_name, :doc_content_type
      t.integer :doc_file_size
      t.datetime :doc_updated_at
    end
  end

  def self.down
    change_table :versions do |t|
      t.remove :doc_file_name, :doc_content_type, :doc_file_size
      t.remove :doc_updated_at
    end
  end
end
