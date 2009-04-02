class Listing < ActiveRecord::Base
  acts_as_rateable
  
  belongs_to :user
  belongs_to :book

end
