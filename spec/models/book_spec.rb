require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "create a new book" do

  it "should create a new instance given valid attributes" do
    @book = Factory( :book )
    @book.should be_valid
  end

  it "should not allow two books with the same isbn number" do
    @book1 = Factory(:book, :isbn => '12345678910')
    @book2 = Factory.build(:book, :isbn => '12345678910')
    @book2.should_not be_valid
    @book2.errors[:isbn].should eql("this book already exists")
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