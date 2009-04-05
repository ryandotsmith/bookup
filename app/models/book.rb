class Book < ActiveRecord::Base
  has_many :listings
  has_many :users, :through => :listings
  validates_presence_of :isbn
  validates_uniqueness_of :isbn, :message => "this book already exists"

  ####################
  # note that market_status == 1 => listing is available 
  def get_all_for_sale
    Listing.find_all_by_market_status( 1 , :include => :user )
  end#get_all_for_sale

end
