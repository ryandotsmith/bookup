class Book < ActiveRecord::Base
  has_many :listings
  has_many :users, :through => :listings
  validates_presence_of :isbn
  validates_uniqueness_of :isbn, :message => "this book already exists"
  validates_numericality_of :isbn, :greater_than_or_equal_to => 10
  ####################
  # note that market_status == 1 => listing is available 
  def get_all_for_sale
    Listing.find_all_by_market_status( 1 , :include => :user )
  end#get_all_for_sale
  ####################
  #self.average_price()
  def self.average_price()
    sum = 0.0
    n   = 0    
    Book.find(:all).each do |book|
      next if book.average_price() == 0.0
      sum += book.average_price()
      n += 1
    end
    return(sum/n) if n != 0
    n.to_f
  end#self.average_price()
  ####################
  #average_price() if there are no listings return 0.0
  def average_price()
    sum = 0.0
    n   = 0
    listings.each do |listing|
      sum += listing.price
      n+=1
    end
    return(sum/n) if n != 0
    n.to_f
  end#average_price()

end# Book
