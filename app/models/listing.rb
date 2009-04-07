class Listing < ActiveRecord::Base
  acts_as_rateable  
  belongs_to :user
  belongs_to :book  
  validates_presence_of :price
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01
  
end
