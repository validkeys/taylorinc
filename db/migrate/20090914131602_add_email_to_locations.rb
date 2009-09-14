class AddEmailToLocations < ActiveRecord::Migration
  def self.up
    add_column(:locations, :email, :string, :limit => 100)
  end

  def self.down
    remove_column(:locations, :email)
  end
end
