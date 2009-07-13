require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AmazonProducts::Lookup do
  before do
    @model = AmazonProducts::Lookup.new('0596516177')
  end
  
  it 'should set search_by and identifier upon instantiation' do
    @model.search_by.should == 'ASIN'
    @model.identifier.should == '0596516177'
  end
  
  it 'should default to returning a medium response group size' do
    @model.response_group_size.should == 'Medium'
  end
  
  it 'should lookup specific items' do
    product = @model.execute
    product.title.should == 'The Ruby Programming Language'
    product.authors.should == ['David Flanagan', 'Yukihiro Matsumoto']
  end
  
  it 'should lookup specific items by ISBN' do
    model = AmazonProducts::Lookup.new('0974514055', :search_by => 'ISBN', :index => 'Books')
    product = model.execute
    product.title.should == "Programming Ruby: The Pragmatic Programmers' Guide, Second Edition"
    product.lowest_price_usd.should eql( 8 )
  end
  
  it "should return a list of offers" do
    model = AmazonProducts::Lookup.new('0974514055', :search_by => 'ISBN', :index => 'Books', :response_group_size => 'Offers')
    product = model.execute
    product.offers.should eql( 6 )
  end

end