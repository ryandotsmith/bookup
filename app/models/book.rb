class Book < ActiveRecord::Base
  has_many :listings
  has_many :users, :through => :listings

  ####################
  # note that market_status == 1 => listing is available 
  def get_all_for_sale
    Listing.find_all_by_market_status( 1 , :include => :user )
  end#get_all_for_sale

end
