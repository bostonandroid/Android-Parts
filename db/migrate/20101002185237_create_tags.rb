class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :taggable, :polymorphic => true

      t.timestamps
    end
    add_index :taggings, [:taggable_type, :taggable_id]
    add_index :taggings, :tag_id
    add_index :tags, :name
  end

  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
