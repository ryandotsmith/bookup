Feature: Removing my book from the marketplace 
	In order to provide the community with accurate data 
	As a listing's owner / student 
	I want to mark my listing as being sold 
	
	Scenario: I sold my book, now i want to set it's stats to sold 
		Given I am signed in
		And I have a listing marked available
		And I navigate to my listings page
		Then I should see "mark as sold"
		When I navigate to my edit listing page
		And I select "sold" from "listing_market_status"
		And I press "update"
		Then I should see "sold"
		And It should not be in the available list