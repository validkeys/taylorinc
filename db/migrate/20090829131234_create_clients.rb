class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :slug, :null => :no, :limit => 128
      t.string :name, :null => :no, :limit => 128
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
