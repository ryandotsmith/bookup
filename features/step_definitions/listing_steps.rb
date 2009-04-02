When /^I navigate to the new listing page$/ do
  visit "/books/#{Book.find( :first).id}/listings/new?book_id=#{Book.find( :first).id}"
end

Then /^I should see my new listing$/ do
  Then %{I should see "email@person.com"}
end

Given /^I have a listing marked available$/ do
  @user = User.find_by_email("email@person.com")
  @book = Factory(:book)
  @listing = Factory( :listing, :book => @book ,:user => @user, :market_status => 1)
end

Given /^I navigate to my listings page$/ do
  @user = User.find_by_email("email@person.com")
  visit "/users/#{@user.id}/listings"
end

Given /^I navigate to my edit listing page$/ do
  @user = User.find_by_email("email@person.com")
  visit "/users/#{@user.id}/listings/#{@listing.id}/edit"
end

Given /^It should not be in the available list$/ do
  @book.get_all_for_sale.include?(@listing).should eql( false )
end




