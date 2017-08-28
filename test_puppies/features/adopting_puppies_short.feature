Feature: Adopting puppies

     Background: 
        Given I am on the puppy adoption site

    Scenario: Thank you message should be displayed
        When I complete the adoption of a puppy
        Then I should see "Thank you for adopting a puppy!"
