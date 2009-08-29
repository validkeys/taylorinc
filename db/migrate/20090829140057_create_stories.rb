class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :slug, :null => :no, :limit => 128
      t.string :title, :null => :no, :limit => 128
      t.text :body, :null => :no

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
