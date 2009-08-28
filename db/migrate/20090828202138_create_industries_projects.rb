class CreateIndustriesProjects < ActiveRecord::Migration
  def self.up
    create_table :industries_projects do |t|
      t.references :industry
      t.references :project
      t.integer :position, :null => :no, :default => 1
    end
  end

  def self.down
    drop_table :industries_projects
  end
end
