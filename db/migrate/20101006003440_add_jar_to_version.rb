class AddJarToVersion < ActiveRecord::Migration
  def self.up
    change_table :versions do |t|
      t.string :jar_file_name, :jar_content_type
      t.integer :jar_file_size
      t.datetime :jar_updated_at
    end
  end

  def self.down
    change_table :versions do |t|
      t.remove :jar_file_name, :jar_content_type, :jar_file_size
      t.remove :jar_updated_at
    end
  end
end
