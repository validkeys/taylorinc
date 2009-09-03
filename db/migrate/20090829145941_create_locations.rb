class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :position, :null => :no, :default => 1
      t.string :title, :null => :no, :limit => 100
      t.string :street_1, :null => :no, :limit => 100
      t.string :street_2, :limit => 100
      t.string :city, :null => :no, :limit => 100
      t.string :province, :null => :no, :limit => 2
      t.string :country, :null => :no, :limit => 32
      t.string :postal_code, :null => :no, :limit => 20
      t.float :lat
      t.float :lng
      t.text :contact_info, :null => :no
      
      # paperclip attachment fields
      t.string :image_file_name # Original filename
      t.string :image_content_type # Mime type
      t.integer :image_file_size # File size in bytes
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
