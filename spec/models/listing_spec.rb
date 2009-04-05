require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "creating a listing" do
  before(:each) do
    @user = Factory(:email_confirmed_user)
    @book = Factory(:book)
  end
  it "should create a new instance given valid attributes" do
    @listing = Factory(:listing, :user => @user, :book => @book )
  end
  
  it "should fail when the price is not a real value" do
    @listing = Factory.build(:listing, :user => @user, :book => @book, :price => -1 )
    @listing.should_not be_valid
    @listing.errors[:price].should eql("must be greater than or equal to 0.01")
  end

end

describe "getting valuable data from the listing" do

  before(:each) do
    @user = Factory(:email_confirmed_user, :name => "James Brown")
    @book = Factory(:book)
    @listing = Factory(:listing, :user => @user, :book => @book )    
  end
  
  it "should find a list of users from a certain book association" do
    @book.listings.first.user.name.should == "James Brown"
  end
  
end

