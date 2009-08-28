class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :position, :null => :no, :default => 1
      t.string :title, :null => :no

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
