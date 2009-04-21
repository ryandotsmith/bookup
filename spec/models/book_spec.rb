require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "create a new book" do

  it "should create a new instance given valid attributes" do
    @book = Factory( :book )
    @book.should be_valid
    @book.discipline_list.should == ["Uncategorized"]
  end

  it "should not allow two books with the same isbn number" do
    @book1 = Factory(:book, :isbn => '0131898345')
    @book2 = Factory.build(:book, :isbn => '0131898345')
    @book2.should_not be_valid
    @book2.errors[:isbn].should eql("this book already exists")
  end
  
  describe "generating book info from an isbn number" do

    it "should validate and hyphenate the ISBN number" do
      @book1 = Factory.build(:book, :isbn => "0131898345")
      @book1.scrub_isbn
      @book1.isbn.should eql("0-13-189834-5")
    end

    it "should populate attributes with amazon data" do
      @book1 = Factory.build(:book, :isbn => "0131898345")
      @book1.fetch_attrs_from_amazon()
      @book1.title.should eql("Introduction to Logic")
      @book1.edition.should eql("12th")
      @book1.authors.should eql(["Irving M. Copi", "Carl Cohen"])
      @book1.list_price.should eql( @book1.list_price )
      @book1.img_url.should eql( @book1.img_url )
    end
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

describe "tagging a book" do
  before(:each) do
    @math_book = Factory.build( :book )
    @math_book.discipline_list << "Mathematics"
    @math_book.discipline_list << "Statistics"
    @math_book.course_title_list << "Introduction to Mathematical Statistics"
    @math_book.course_number_list << "436"
    @math_book.save

    @cs_book = Factory.build( :book )
    @cs_book.instructor_list << "Yong Zeng"
    @cs_book.discipline_list << "Computer Science"
    @cs_book.save
  end# before 

  it "should suggest discipline tags based on user input" do
    params = {}
    params[:autocomplete_attr] = "discipline"
    params[:q] = "ma"
    result = Book.suggest_tags( params )
    result.include?("Mathematics").should == true
    result.include?("Statistics").should == false
  end

  it "should suggest discipline tags based on user input" do
    params = {}
    params[:autocomplete_attr] = "discipline"
    params[:q] = "ma"
    result = Book.suggest_tags( params )
    result.include?("Mathematics").should == true
    result.include?("Computer Science").should == false    
  end
  
  it "should suggest instructors based on user input" do
    params = {}
    params[:autocomplete_attr] = "instructor"
    params[:q] = "Zen"
    result = Book.suggest_tags( params )
    result.include?("Yong Zeng").should == true
  end

  it "should suggest course title based on user input" do
    params = {}
    params[:autocomplete_attr] = "course_title"
    params[:q] = "introduction"
    result = Book.suggest_tags( params )
    result.include?("Introduction to Mathematical Statistics").should == true        
  end
  
  it "should suggest course number based on user input" do
    params = {}
    params[:autocomplete_attr] = "course_number"
    params[:q] = "4"
    result = Book.suggest_tags( params )
    result.include?("436").should == true    
  end

end

describe "sorting books on tags" do
  before(:each)do
    @b1 = Factory(:book)
    @b1.discipline_list << "Mathematics"
    @b1.save

    @b2 = Factory(:book)
    @b2.discipline_list << "Mathematics"
    @b2.save

    @b3 = Factory(:book)
    @b3.discipline_list << "Computer Science"
    @b3.save

    @b4 = Factory(:book)
    @b4.discipline_list << "Computer Science"
    @b4.save

    @b5 = Factory(:book)
    
  end
  
  it "should return an array with tag name as first element" do
    params = {}
    params[:q] = "discipline"
    result = Book.find_and_sort( params )
    result.should == [ [ "Uncategorized",    [@b5]     ], 
                       [ "Mathematics",      [@b1,@b2] ], 
                       [ "Computer Science", [@b3,@b4] ] ].sort
  end

  it "should put all of the books without tags at the end of the hash" do
    params = {}
    params[:q] = "discipline"
    result = Book.find_and_sort( params )
    result.last.should == ["Uncategorized",[ @b5 ] ]
  end
  
  
end


