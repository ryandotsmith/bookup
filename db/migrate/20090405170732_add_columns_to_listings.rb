class AddColumnsToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :price, :float
  end

  def self.down
  end
end
