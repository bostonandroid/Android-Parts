class CreateMaintainers < ActiveRecord::Migration
  def self.up
    create_table :maintainers do |t|
      t.string :name, :url, :openid_identifier, :email
      t.belongs_to :organization

      t.timestamps
    end
    add_index :maintainers, :organization_id
    add_index :maintainers, :openid_identifier
  end

  def self.down
    drop_table :maintainers
  end
end
