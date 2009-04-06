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
    @user.listings << Factory(:listing, :book => @book, :user => @user, :price => 1.99 )
    @book.get_all_for_sale.length.should == 1
  end
end

describe "finding the average price of a book" do

  it "should find all listings and then compute the avg" do
    @user = Factory(:email_confirmed_user)
    @book = Factory(:book)
    4.times do |i|
      @user.listings << Factory(:listing, :book => @book, :user => @user, :price => i+1 )
    end
    @book.average_price().should eql(2.5)
  end
  it "should return 0.0 when there are no listings for a book" do
    @user = Factory(:email_confirmed_user)
    @book = Factory(:book)
    @book.listings.count.should eql(0)
    @book.average_price().should eql(0.0)
  end
  it "should find the average price of all books" do
    @user = Factory(:email_confirmed_user)
    @book1 = Factory(:book)
    @book2 = Factory(:book)
    4.times do |i|
      @user.listings << Factory(:listing, :book => @book1, :user => @user, :price => 4)
    end
    4.times do |i|
      @user.listings << Factory(:listing, :book => @book2, :user => @user, :price => 10)
    end
    Book.average_price().should eql(7.00)
  end


end