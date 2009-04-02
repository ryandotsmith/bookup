Given /^I navigate to the page for a book$/ do
  @book = Factory(:book)
  visits "books/#{@book.id}"
end