class CreateIndustriesProjects < ActiveRecord::Migration
  def self.up
    create_table :industries_projects do |t|
      t.references :industry, :null => :no
      t.references :project, :null => :no
      t.integer :position, :null => :no, :default => 1
    end
  end

  def self.down
    drop_table :industries_projects
  end
end
