class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :section, :null => :no
      t.integer :position, :null => :no, :default => 1
      t.string :title, :null => :no
      t.text :body, :null => :no

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
