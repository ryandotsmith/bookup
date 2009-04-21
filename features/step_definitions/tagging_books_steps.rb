require 'rubygems'
require 'safariwatir'

#browser = Watir::Safari.new

Given /^some book has has a discipline tag of (.+)$/ do |disc|
  @book = Factory( :book )
  @book.discipline_list << "#{ disc }"
end

Given /^some other book has has a discipline tag of (.+)$/ do |disc|
  @book1 = Factory( :book )
  @book1.discipline_list << "#{ disc }"
end

When /^I navigate to the edit book page$/ do
  visit edit_book_url(@book)
end

Then /^after some javascript, i should see (.+)$/ do |something|
  browser = Watir::Safari.new
  browser.goto("http://localhost:3000/books/#{@book1.id}/edit")
  browser.text_field(:session_email, "session[email]").set("dave")
  browser.password(:session_password, "session[password]").set("test")
  browser.button(:session_submit, 1).click
  browser.text_field(:name, "discipline_list").set("Ma")
  browser.contains_text("Mathematics").should == true 
end


