class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.string :title
      t.string :url
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
