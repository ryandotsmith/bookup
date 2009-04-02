require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "create a new book" do

  it "should create a new instance given valid attributes" do
    @book = Factory( :book )
    @book.should be_valid
  end

end

describe "find how many copies of this book are for sale" do

  it "should return the number of listings marked 'for sale' " do
    @book = Factory(:book)
    @user = Factory(:email_confirmed_user, :email => "james_brown@gmail.com")
    @user.listings.create(:book_id => @book.id)
    @book.get_all_for_sale.length.should == 1
  end
end