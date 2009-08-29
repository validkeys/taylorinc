class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.integer :position, :null => :no, :default => 1
      t.string :title, :null => :no, :limit => 128
      t.string :url, :null => :no, :limit => 128
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
