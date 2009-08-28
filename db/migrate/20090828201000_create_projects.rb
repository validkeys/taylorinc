class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :slug
      t.string :title
      t.string :client
      t.text :description
      t.references :industry
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
