class User < ActiveRecord::Base
  include Clearance::App::Models::User
  attr_accessible :name
  has_many :listings
  has_many :books, :through => :listings
  validates_presence_of :name
  
  ####################
  #get_active_listings
  def get_active_listings
    Listing.find_all_by_market_status( 1, :conditions => "user_id = #{ self.id }")
  end#get_active_listings
end