Feature: Trade Books
	In order to save students money
	As a student
	I want to put my used book on a list so that other can buy it from me
	
	Scenario: Adding my book the list of books for sale or trade
		Given I am on the books index page
    And I am signed up and confirmed as "email@person.com/password"
		And I sign in as "email@person.com/password"
		Then I should see a link to sell my book
		When I go to the add new book page
		And I fill in "book_title" with "Introduction to Logic"
		And I fill in "book_description" with "Great condition!! I will also include HW solutions"
		And I fill in "book_isbn" with "12345678910"
		And I press "submit" 
		Then I should see "Introduction to Logic"
		Then I should see "Great condition!! I will also include HW solutions" 
		
	Scenario: Viewing books that I own that are for sale 
		Given I am on the books index page
    And I am signed up and confirmed as "email@person.com/password"
		And I sign in as "email@person.com/password"
		Given I have a book with the title Introduction to Logic
		Then I should see a list of books that i own
		And I should see "Introduction to Logic" 