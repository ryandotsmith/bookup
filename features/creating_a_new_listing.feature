Feature: Add a new listing for a book
	In order to sell my book for more money than the bookstore will give me 
	As a student 
	I want to find the appropriate book and create a listing to sell my copy
	
	Scenario: I found the right book and now i will add my listing 
		Given I am signed in
		And I am on the books index page
		And the book I have exists
		And the book has the isbn "123456789"
		When I navigate to my books show page
		Then I should see "sell your copy" 
		When I navigate to the new listing page
		And I fill in "comment" with "book is in excellent shape"
		And I press "submit" 
		Then I should see my new listing
