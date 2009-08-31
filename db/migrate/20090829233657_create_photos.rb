class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :project, :null => :no
      t.integer :position, :null => :no, :default => 1
      t.string :title, :limit => 100
      
      # paperclip attachment fields
      t.string :image_file_name # Original filename
      t.string :image_content_type # Mime type
      t.integer :image_file_size # File size in bytes
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
