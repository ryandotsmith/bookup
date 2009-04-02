When /^I navigate to the new listing page$/ do
  visit "/books/#{Book.find( :first).id}/listings/new?book_id=#{Book.find( :first).id}"
end