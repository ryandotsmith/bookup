class AddColumnsToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :price, :float
    add_column :listings, :interesting_trades, :boolean

  end

  def self.down
  end
end
