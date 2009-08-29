class CreateIndustries < ActiveRecord::Migration
  def self.up
    create_table :industries do |t|
      t.integer :position, :null => :no, :default => 1
      t.string :slug, :null => :no, :limit => 128
      t.string :title, :null => :no, :limit => 128

      t.timestamps
    end
  end

  def self.down
    drop_table :industries
  end
end
