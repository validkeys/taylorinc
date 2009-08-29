class CreateDepartmentsProjects < ActiveRecord::Migration
  def self.up
    create_table :departments_projects do |t|
      t.references :department, :null => :no
      t.references :project, :null => :no
      t.integer :position, :null => :no, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :departments_projects
  end
end
