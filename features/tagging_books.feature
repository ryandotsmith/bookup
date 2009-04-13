Feature: Tagging a book
	In order to get better visibility for my listing
	As a user 
	I want to tag my newly added listing with appropriate course information
	
	Scenario: Adding a discipline tag to a book
		Given a book exists with a discipline_tag of "Mathematics"
		And a book exists with a discipline_tag of "Martial Arts"
		When I am on the edit book page
		And I fill in "Discipline" with "Ma"
		Then I should see "Mathematics"
		And I should see "Martial Arts"
		And I fill in "Discipline" with "Math"
		Then I should see "Mathematics"
		