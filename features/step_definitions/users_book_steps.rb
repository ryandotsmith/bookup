Then /^I should see a link to sell my book$/ do
  Then %{I should see "sell your copy"}
end

Then /^I should see a list of books that i own$/ do
  Then %{I should see "your books"}
end

Given /^I have a book with the title (.+)$/ do |title|
  user = User.find_by_email("email@person.com")
  book = Factory(:book, :user => user, :title => title)
end

Then /^I should should have that book in a list of books that i own$/ do
  user = User.find_by_email("email@person.com")
  user.books.should_not eql(0)
end