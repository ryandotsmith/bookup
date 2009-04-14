Feature: Tagging a book
	In order to get better visibility for my listing
	As a user 
	I want to tag my newly added listing with appropriate course information
	
	Scenario: Adding a discipline tag to a book
		Given I am signed in
	 	And some book has has a discipline tag of "Mathematics"
		And some other book has has a discipline tag of "Martial Arts"
		When I navigate to the edit book page
		And I fill in "book_discipline_list" with "Ma"
		Then after some javascript, i should see "math"
		And I should see "Martial Arts"
		And I fill in "book_discipline_list" with "Math"
		Then I should see "Mathematics"
		