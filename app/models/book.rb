class Book < ActiveRecord::Base
  has_many :listings
  has_many :users, :through => :listings
  validates_presence_of :isbn
  validates_uniqueness_of :isbn, :message => "this book already exists"
  validates_numericality_of :isbn, :greater_than_or_equal_to => 10

  ####################
  #edition
  def edition
    if read_attribute(:edition) == nil or read_attribute(:edition) == ""
      return "nil"
    else
      read_attribute(:edition).to_i.ordinalize
    end
  end#edition
  ####################
  #to_10!
  def to_10!
    if self.isbn.include?("978")
      self.isbn = ISBN_Tools.isbn13_to_isbn10(self.isbn)
    end    
  end#to_10!
  ####################
  #scrub_isbn()
  def scrub_isbn()
    if ISBN_Tools.is_valid?(self.isbn)
      self.to_10!
      ISBN_Tools.hyphenate!(self.isbn)
    end    
  end#scrub_isbn()
  ####################
  #fetch_attrs_from_amazon()
  def fetch_attrs_from_amazon()
    self.to_10!
    isbn_number = ISBN_Tools.cleanup(self.isbn)
    lookup = AmazonProducts::Lookup.new( isbn_number, 'ISBN')
    result = lookup.execute
    self.title   = result.title if result.attribute_names.include? 'title'
    self.edition = result.edition if result.attribute_names.include? 'edition'
    self.authors = result.authors if result.attribute_names.include? 'authors'
    self.list_price = result.item_attributes.list_price.formatted_price.to_s if result.attribute_names.include? 'list_price'
    self.img_url    = result.medium_image.url if result.attribute_names.include? 'medium_image'
  end#fetch_attrs_from_amazon()
  ####################
  #img_url()
  def img_url()
    lookup = AmazonProducts::Lookup.new( self.isbn.to_s, 'ISBN')
    result = lookup.execute
    result.medium_image.url
  end#img_url()
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
