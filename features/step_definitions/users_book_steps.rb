require File.expand_path(File.dirname(__FILE__) + '/../../spec/factories/book_factory.rb')

Then /^I should see a link to sell my book$/ do
  Then %{I should see "add a new book to the marketplace"}
end

Then /^I should see a list of books that i own$/ do
  Then %{I should see "your books"}
end

Given /^I have a book with the title (.+)$/ do |title|  
  user = User.find_by_email("email@person.com")
  user.books.create(:title => "some string")
end