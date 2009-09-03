class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :section, :null => :no
      t.integer :position, :null => :no, :default => 1
      t.string :title, :null => :no, :limit => 100
      t.text :body, :null => :no

      # paperclip attachment fields
      t.string :image_file_name # Original filename
      t.string :image_content_type # Mime type
      t.integer :image_file_size # File size in bytes
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
