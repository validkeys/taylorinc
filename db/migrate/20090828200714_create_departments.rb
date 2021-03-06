class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.integer :position, :null => :no, :default => 1
      t.string :title, :null => :no, :limit => 100
      t.string :tag_line, :null => :no, :limit => 100
      t.string :testimonial, :limit => 1000
      t.text :description
      t.string :color_main, :null => :no, :limit => 8
      t.string :color_bg, :null => :no, :limit => 8

      # paperclip attachment fields
      t.string :image_file_name # Original filename
      t.string :image_content_type # Mime type
      t.integer :image_file_size # File size in bytes
      t.datetime :image_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :departments
  end
end
