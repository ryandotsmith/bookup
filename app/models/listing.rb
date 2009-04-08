class Listing < ActiveRecord::Base
  acts_as_rateable  
  belongs_to :user
  belongs_to :book  
  validates_presence_of :price
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01
  
  ####################
  #update_market_status( status )
  def update_market_status( status )
    case status
      when 'available'
        self.market_status = 1
      when 'pending'
        self.market_status = 0
      when 'sold'
        self.market_status = -1
    end
    self.save
  end#update_market_status( status )
end
