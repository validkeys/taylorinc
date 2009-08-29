class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :client, :null => :no
      t.string :slug, :null => :no, :limit => 128
      t.string :title, :null => :no, :limit => 128
      t.string :client, :limit => 128
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
