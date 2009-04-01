require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../factories/book_factory.rb')

describe Book do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :isbn => "value for isbn",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    @user = Factory(:email_confirmed_user)
    @book = Factory( :book , :user => @user )
    @user.books.include?(@book).should eql( true )
    @book.should be_valid
  end
end
