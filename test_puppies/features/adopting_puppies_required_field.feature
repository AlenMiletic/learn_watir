Feature: Adopting Puppies

    Background:
       Given I am on the puppy adoption site
    
    Scenario: Name is a required field
        When I checkout leaving the name field blank
        Then I should see the error message "Name can't be blank"
