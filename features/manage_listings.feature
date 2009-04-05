Feature: Manage listings for books
	In order to buy or sell a book from BookUp (which will save you loads of cash)
	As a student 
	I want to browse, create and delete listings
	
	Scenario: I found the right book and now i will add my listing 
		Given I am signed in
		And I am on the books index page
		And the book I have exists
		And the book has the isbn "123456789"
		When I navigate to my books show page
		Then I should see "sell your copy" 
		When I navigate to the new listing page
		And I fill in "comment" with "book is in excellent shape"
		And I fill in "price" with "3.99"
		And I press "submit" 
		Then I should see my new listing

	Scenario: I sold my book, now i want to set it's stats to sold 
		Given I am signed in
		And I have a listing marked available
		And I navigate to my listings page
		Then I should see "update"
		When I navigate to my edit listing page
		And I select "sold" from "listing_market_status"
		And I press "update"
		Then I should see "your listings ( 0 )"
		And It should not be in the available list
		
	Scenario: I have a listing and I want to change the price
	  Given I am signed in
		And I have a listing marked available
		And I navigate to my listings page
		Then I should see "update"
		When I navigate to my edit listing page 
		When I fill in "price" with "8.00"
		And I press "update"
		Then I should see "listing was successfully updated"
	
	
	