class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.integer :position, :null => :no, :default => 1
      t.string :title, :null => :no, :limit => 100
      t.string :url, :null => :no, :limit => 255
      t.string :tag_line, :limit => 128
      t.string :summary, :limit => 1000
      t.boolean :active, :null => :no, :default => false

      # paperclip attachment fields
      t.string :image_file_name # Original filename
      t.string :image_content_type # Mime type
      t.integer :image_file_size # File size in bytes
      t.datetime :image_updated_at
      
      t.string :transition_image_file_name # Original filename
      t.string :transition_image_content_type # Mime type
      t.integer :transition_image_file_size # File size in bytes
      t.datetime :transition_image_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
