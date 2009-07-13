class AddImgColumnsToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :thumbnail, :string
  end

  def self.down
    remove_column :books, :thumbnail
  end
end
