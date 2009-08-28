class CreateCategoriesProjects < ActiveRecord::Migration
  def self.up
    create_table :categories_projects do |t|
      t.references :category
      t.references :project
      t.integer :position, :null => :no, :default => 1
    end
  end

  def self.down
    drop_table :categories_projects
  end
end
