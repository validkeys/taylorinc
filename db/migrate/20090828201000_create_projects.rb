class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :slug, :null => :no
      t.string :title, :null => :no
      t.string :client
      t.text :description
      t.references :department

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
