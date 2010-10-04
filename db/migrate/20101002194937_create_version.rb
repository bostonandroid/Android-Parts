class CreateVersion < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string :number, :license_url, :license
      t.integer :min_sdk
      t.belongs_to :package

      t.timestamps
    end
    add_index :versions, :package_id
  end

  def self.down
    drop_table :versions
  end
end
