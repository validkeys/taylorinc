class CreateCategoriesProjects < ActiveRecord::Migration
  def self.up
    create_table :categories_projects do |t|
      t.references :category, :null => :no
      t.references :project, :null => :no
      t.integer :position, :null => :no, :default => 1
    end
  end

  def self.down
    drop_table :categories_projects
  end
end
