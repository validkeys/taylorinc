class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      #t.references :client, :null => :no
      t.string :permalink, :null => :no, :limit => 128
      t.string :title, :null => :no, :limit => 100
      t.string :client, :null => :no, :limit => 100
      t.text :description

      # paperclip attachment fields
      t.string :image_file_name # Original filename
      t.string :image_content_type # Mime type
      t.integer :image_file_size # File size in bytes
      t.datetime :image_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
