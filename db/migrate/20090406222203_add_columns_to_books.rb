class AddColumnsToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :authors, :string
    add_column :books, :list_price, :string
    add_column :books, :img_url, :string
  end

  def self.down
    remove_column :books, :authors
  end
end
