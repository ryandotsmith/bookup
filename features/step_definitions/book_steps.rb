Given /^I navigate to the page for a book$/ do
  @book = Factory(:book)
  visit "books/#{@book.id}"
end

Given /^my books is not on the list$/ do
  @my_book = Factory.build(:book, :title => "a new unheard of book")
  Book.find(:all).include?(@my_book).should == false
end

Given /^the book I have exists$/ do
  @existing_book = Factory(:book)
end

Given /^the book has the isbn "(.*)"$/ do |number|
  @existing_book.isbn = number
  @existing_book.save
end

Given /^I navigate to my books show page$/ do
  visit "books/#{@existing_book.id}"
end

Then /^I should see a link to add a book to the list$/ do
    Then %{I should see "add it to the list"}
end

