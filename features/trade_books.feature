Feature: Trade Books
	In order to save students money
	As a student
	I want to put my used book on a list so that others can buy it from me
	
	Scenario: Adding my book the list of books for sale or trade
		Given I navigate to the page for a book
    And I am signed up and confirmed as "email@person.com/password"
		And I sign in as "email@person.com/password"
		Then I should see a link to sell my book
		When I navigate to the new listing page
		And I fill in "comment" with "book is in excellent shape"
		And I press "submit" 
		
	Scenario: Viewing books that I own that are for sale 
		Given I am on the books index page
    And I am signed up and confirmed as "email@person.com/password"
		And I sign in as "email@person.com/password"
		Given I have a book with the title Introduction to Logic
		Then I should see a list of books that i own
		And I should should have that book in a list of books that i own
		
		
	Scenario: Marking a book as sold 
		Given I am on the books index page 
		When I open my bookshelf
		And I mark one of my books as sold 
		Then I should not see it on the list of books for sale 
		And I should see a sold book in my bookshelf
	
	Scenario: Contacting a seller 
		Given I am on the books index page 
		When I click on the contact seller link
		Then I should see the email address of the seller
