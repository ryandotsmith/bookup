require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "creating a listing" do

  it "should create a new instance given valid attributes" do
    @user = Factory(:email_confirmed_user)
    @book = Factory(:book)
    @listing = Factory(:listing, :user => @user, :book => @book )
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