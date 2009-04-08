class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.belongs_to :book
      t.belongs_to :user

      t.integer :market_status, :default => 1
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
