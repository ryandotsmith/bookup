Feature: Adding a new book 
	In order to save students money on books
	As a student or an instructor
	I want to add a text book to the list of course text books
	
	Scenario: The book I have to sell does not exist on the books list
		Given I am signed in
		And I am on the books index page
		And my books is not on the list 
		Then I should see a link to add a book to the list
		When I go to add new book page
		And I fill in "book_isbn" with "0131898345"
		And I press "submit"
		Then I should see "Update tags or Go to Book." 

	Scenario: The book I have is on the list and I try to add the book	
		Given I am signed in
		And the book I have exists
		And the book has the isbn "0-13-189834-5"
		When I go to add new book page
		And I fill in "book_isbn" with "0-13-189834-5"
		And I press "submit"
		Then I should see "this book already exists"
