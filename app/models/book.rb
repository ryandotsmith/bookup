class Book < ActiveRecord::Base
  acts_as_taggable_on :discipline, :course_title, :course_number, :instructor
  has_many :listings
  has_many :users, :through => :listings
  has_many :active_listings, :class_name => "Listing", :conditions => { :market_status => 1 }
  validates_presence_of :isbn
  validates_uniqueness_of :isbn, :message => "this book already exists"
  validate :valid_isbn
  ####################
  #self.find_and_sort
  def self.find_and_sort( params={} )
    disciplines = []
    Book.discipline_counts.each do |discipline|
      disciplines << discipline.name
    end

    hash = {}
    disciplines.each do |discipline|
      hash[discipline] = Book.tagged_with( discipline, :on => :discipline )
    end
    hash
  end#self.find_and_sort
  ####################
  #self.suggest_tags( params )
  def self.suggest_tags( params )
    search_on = params[:autocomplete_attr]
    search_string = params[:q]
    @all_tags = Book.send("#{search_on}_counts")
    @tags = []
    @all_tags.each do |tag|
      @tags << tag.name if tag.name.downcase.include?(search_string.to_s.downcase)
    end
    @tags
  end#self.suggest_tags( params )
  ####################
  #valid_isbn
  def valid_isbn
    errors.add(:isbn, "This is not a valid ISBN.") unless ISBN_Tools.is_valid?(self.isbn)  
  end#valid_isbn
  ####################
  #edition
  def edition
    if read_attribute(:edition) == nil or read_attribute(:edition) == ""
      return ""
    else
      read_attribute(:edition).to_i.ordinalize.to_s 
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
    begin
      self.to_10!
      isbn_number = ISBN_Tools.cleanup(self.isbn)
      lookup = AmazonProducts::Lookup.new( isbn_number, 'ISBN')
      result = lookup.execute
      self.title      = result.title
      self.edition    = result.edition
      self.authors    = result.authors
      self.list_price = result.list_price_usd
      self.img_url    = result.medium_image.url
    rescue
      false
    end
  end#fetch_attrs_from_amazon()
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
